#!/usr/local/bin/ruby
# encoding: utf-8

=begin
  Name: StructureGenerator.rb
  Author: Fabrizio Alonzi
  Description: It creates a Model / Controller structure for Express starting from an OrientDB description file
=end

require 'erb'

AUTHOR = "Fabrizio Alonzi"

# ALREADY PARSED CLASSES STACK
$alreadyParsedStack = []

# ALREADY PARSED PARENT CLASSES STACK
$alreadyParsedParentStack = []

# CLASS DESCRIBER VARIABLES
$className = nil
$classParent = nil
$classFields = []

# EDGE CLASSES STACK
$edgesStack = []

# Creates the javascript file for the model
def CreateModelFile( modelTemplateCode )
  myFile = File.new( "models/" + $className.capitalize + ".js", "w" )
  myJavascriptCode = ERB.new modelTemplateCode
  myFile.puts( myJavascriptCode.result )
  myFile.close
end

# Creates the javascript file for the controller
def CreateControllerFile(  controllerTemplateCode )
  myFile = File.new( "controllers/" + $className.downcase + "_controller.js", "w" )
  myJavascriptCode = ERB.new controllerTemplateCode
  myFile.puts( myJavascriptCode.result )
  myFile.close
end

# Creates the javascript file for the edges wrapper class
def CreateEdgesWrapperFile(  edgeWrapperTemplateCode )
  myFile = File.new( "edges_wrapper.js", "w" )
  myJavascriptCode = ERB.new edgeWrapperTemplateCode
  myFile.puts( myJavascriptCode.result )
  myFile.close
end

# Creates the routing definitions file
def CreateRoutingFile()
  myFile = File.new( "routing.js", "a" )
  $alreadyParsedStack.each do | currentClass |
    myFile.puts "var #{currentClass}Controller = require('./routes/#{currentClass.downcase}_controller');"
    myFile.puts "app.use('/api/#{currentClass.downcase}s/', #{currentClass}Controller );"
  end
  myFile.close
end

$propertiesFromBaseClasses = []

# Retrieves all the properties for a class from base classes
def SearchPropertiesFromBase( currentClassName )
  begin
    File.open( $fileName, "r" ) do |file|
      file.each_line do |line|
        if line.include? "create class #{currentClassName}"
          # Getting the properties of the class from the file
          begin
            File.open( $fileName, "r" ) do |file2|
              file2.each_line do |line2|
                if line2.include? "create property #{currentClassName}."
                  linePropertyElement = line2.split( "." )
                  linePropertyElement = linePropertyElement[1].split( " " )
                  linePropertyElement = linePropertyElement[0]
                  $propertiesFromBaseClasses.push( linePropertyElement )
                end
              end
            end
          rescue Exception => e
              puts "Errore durante l'elaborazione delle proprietà di classe! :( [ #{e.message} ]"
          end
          if line.include? "extends" and not line.include? "extends V\n" and not line.include? "extends E\n"
            tmpSplittedStringForParent = line.split( "extends" )
            $classParent = tmpSplittedStringForParent[tmpSplittedStringForParent.length - 1]
            if ( $alreadyParsedParentStack.include? $classParent )
              $alreadyParsedParentStack.push( $classParent )
              SearchPropertiesFromBase( $classParent )
            else
                return
            end
          end
        end
      end
    end
  rescue Exception => e
      puts "Errore durante l'elaborazione delle proprietà delle classi base! :( [ #{e.message} ]"
  end
end

# Main procedure
def Main
  # Getting the codes template
  templateString = DATA.read
  templateSections = templateString.split( "SECTION_END" )

  templateStringModel = templateSections[0]
  templateStringController = templateSections[1]
  templateEdgeWrapperModel = templateSections[2]

  begin
    puts "Inserisci il nome del file da importare:"
    $fileName = gets
    $fileName.chomp!
    begin
      File.open( $fileName, "r") do |f|
        f.each_line do |line|
          if line.include? "create class " and not line.include? "--" and not line.include? "extends E\n"
            line.slice! "create class "
            lineElements = line.split( " " )
            $className = lineElements[0]
            puts "Creando la struttura per la classe #{$className}"
            # Adding the current class to the parsed classes stack
            if $alreadyParsedStack.include?( $className )
              next
            else
              $alreadyParsedStack.push( $className )
            end

            # Checking for inheritance of the class

            if line.include? "extends" and not line.include? "extends V\n" and not line.include? "extends E\n"
              tmpSplittedStringForParent = line.split( "extends" )
              $classParent = tmpSplittedStringForParent[tmpSplittedStringForParent.length - 1].chomp.strip
              # Getting the properties of the class from base classes
              SearchPropertiesFromBase( $classParent )
            else
              $classParent = nil
              $propertiesFromBaseClasses = []
            end

            # Getting the properties of the class from the file
            begin
              File.open( $fileName, "r" ) do |f2|
                puts "Inserendo i campi dati per la classe #{$className}"
                f2.each_line do |line2|
                  if line2.include? "create property #{$className}."
                    linePropertyElement = line2.split( "." )
                    linePropertyElement = linePropertyElement[1].split( " " )
                    linePropertyElement = linePropertyElement[0]
                    puts "Identificato il campo dati #{$className}.#{linePropertyElement}"
                    $classFields.push( linePropertyElement )
                  end
                end
              end
            rescue Exception => e
                puts "Errore durante l'elaborazione delle proprietà di classe! :( [ #{e.message} ]"
            end

            # Creating the js files
            puts "Creando il file di model per la classe #{$className}"
            $propertiesFromBaseClasses.uniq!  # Eventually it will remove duplicates properties
            CreateModelFile( templateStringModel )
            puts "Creando il file di controller per la classe #{$className}"
            CreateControllerFile( templateStringController )
            $classFields = []
          else
            if line =~ /^create class [\s\S]* extends E$/
              edge = line.split( ' ' )[2]
              $edgesStack.push( edge )
            end
          end
        end
        # The stacks must be empty now
        $propertiesFromBaseClasses = []
        $alreadyParsedParentStack = []
      end
    rescue Exception => e
      puts "Errore durante l'elaborazione del file delle classi! :( [ #{e.message} ]"
    end
    puts "Creando il file per il Wrapper di Edges"
    CreateEdgesWrapperFile( templateEdgeWrapperModel )
    puts "Creando il file di generale di routing"
    CreateRoutingFile()
  rescue Exception => e
    puts "Errore generico! :( [ #{e.message} ]"
  end
  puts "Esecuzione dello script terminata! :D"
end

# Program entrypoint
Main()

__END__
/**************************************************************************
* Name: <%= $className.capitalize %>.js
* Author: <%= AUTHOR %>
* Description: <%= $className %> model file
**************************************************************************/
<%
 fieldsInArgumentsFormat = ""
 fieldsForInsertUpdateFormat = ""
 accessorsCode = ""

 $propertiesFromBaseClasses.each do |field|
   fieldsInArgumentsFormat += ", #{field}"
   fieldsForInsertUpdateFormat += "#{field} : this.#{field}, "
   accessorsCode += %{
#{$className}.prototype.Get#{field.capitalize} = function(){
      return this.#{field};
}

#{$className}.prototype.Set#{field.capitalize} = function( #{field} ){
      this.#{field} = #{field};
}
   }
 end

 $classFields.each do |field|
   fieldsInArgumentsFormat += ", #{field}"
   fieldsForInsertUpdateFormat += "#{field} : this.#{field}, "
   accessorsCode += %{
#{$className}.prototype.Get#{field.capitalize} = function(){
      return this.#{field};
}

#{$className}.prototype.Set#{field.capitalize} = function( #{field} ){
      this.#{field} = #{field};
}
   }
 end

 fieldsForInsertUpdateFormat = fieldsForInsertUpdateFormat[0 .. (fieldsForInsertUpdateFormat.length - 3)]

 fieldsInitializationString = ""
 $propertiesFromBaseClasses.each do |field|
   fieldsInitializationString += " this.#{field} = ( #{field} !== undefined ? #{field} : null );\n"
 end

 $classFields.each do |field|
   fieldsInitializationString += " this.#{field} = ( #{field} !== undefined ? #{field} : null );\n"
 end
%>
 var <%= $className %> = function( connection <%= fieldsInArgumentsFormat %> ){
  this.db = connection.db;
  this.rid = null;

  // Variables of the object
  <%=fieldsInitializationString %>
}

<%= $className %>.Create = function( connection <%= fieldsInArgumentsFormat %> ){
  return new <%= $className %>( connection <%= fieldsInArgumentsFormat %> );
}

<%= $className %>.All = function( connection, callback ){
  connection.db.query('SELECT * FROM <%= $className %>').then( function( results ){
   callback ( results );
  });
}

<%= $className %>.Find = function( connection, id, callback ){
 connection.db.query('SELECT * FROM <%= $className %> WHERE @rid = :rid LIMIT 1', {
   params:{
     rid: id
   }
 }).then( function( result ){
   callback ( result );
 });
}

<%= $className %>.prototype.Take = function( numberOfElements, callback ){
 this.db.query('SELECT * FROM <%= $className %> LIMIT :limit', {
   params:{
     limit: numberOfElements
   }
 }).then( function( results ){
  callback ( results );
 });
}

<%= $className %>.prototype.First = function( numberOfElements, callback ){
 this.db.query('SELECT * FROM <%= $className %> ORDER BY @rid ASC LIMIT :limit', {
   params:{
     limit: numberOfElements
   }
 }).then( function( results ){
  callback ( results );
 });
}

<%= $className %>.prototype.Last = function( numberOfElements, callback ){
 this.db.query('SELECT * FROM <%= $className %> ORDER BY @rid DESC LIMIT ' + numberOfElements ).then( function( results ){
  callback ( results );
 });
}

<%= $className %>.TraverseAllGraph = function( connection, id, callback ){
  connection.db.query('TRAVERSE * FROM #' + id ).then( function( results ){
   callback ( results );
  });
}

<%= $className %>.TraverseToLevel = function( connection, id, depthLevel, callback ){
  connection.db.query('TRAVERSE * FROM #' + id + ' while $depth <= ' + depthLevel ).then( function( results ){
   callback ( results );
  });
}
// ----------------------------------------------------

<%= $className %>.prototype.Delete = function( callback ){
  var idToDelete = this.rid;
  this.db.query( 'DELETE FROM <%= $className %> WHERE @rid = :id', {
    params: {
      id: idToDelete
    }
  }).then( function( totalDeleted ){
   callback ( totalDeleted );
  });
}

<%= $className %>.prototype.Save = function(){
  var idToSave = this.rid;

  if ( idToSave == null )
  {
    this.db.insert().into('<%= $className %>').set({<%= fieldsForInsertUpdateFormat %>}).one();
  }
  else
  {
    this.db.update('<%= $className %>').set({<%= fieldsForInsertUpdateFormat %>}).where({ '@rid': idToSave }).scalar();
  }
}

// Accessors methods
<%= accessorsCode %>

module.exports = <%= $className %>;
//**************************************
SECTION_END
/**************************************************************************
* Name: <%= $className.downcase %>_controller.js
* Author: <%= AUTHOR %>
* Description: <%= $className %> controller file
**************************************************************************/

var express = require('express');
var Connection  = require('../my_modules/connection');
var EdgesWrapper = require( '../edges_wrapper' );
var <%= $className %> = require( '../models/<%= $className %>' );

var conn = new Connection();

var router = express.Router();

// GET All <%= $className %>
router.get('/', function(req, res) {
  <%= $className %>.All( conn, function( results ){
   res.json( results );
  });
});

// GET Finds a specific <%= $className %>
router.get('/:id', function(req, res) {
  // Getting the id of <%= $className %>
  var id = req.params.id;
  <%= $className %>.Find( conn, id, function( result ){
   res.json( result );
  });
});

// GET Traverse across a specific <%= $className %>
router.get('/:id/traverse', function(req, res) {
  // Getting the id of <%= $className %>
  var id = req.params.id;
  <%= $className %>.TraverseAllGraph( conn, id, function( result ){
   res.json( result );
  });
});

// GET Traverse across a specific <%= $className %> for a specific level
router.get('/:id/traverse/:depth', function(req, res) {
  // Getting the id of <%= $className %>
  var id = req.params.id;
  var depth = req.params.depth;
  <%= $className %>.TraverseToLevel( conn, id, depth, function( result ){
   res.json( result );
  });
});

// POST Updates a specific <%= $className %>
router.put('/:id', function(req, res) {
  // YOUR UPDATING CODE HERE ....
});

// POST Create a specific <%= $className %>
router.post('/', function(req, res) {
  // YOUR CREATING CODE HERE ....
});

// DELETE Deletes a specific <%= $className %>
router.delete('/:id', function(req, res) {
  // YOUR DELETING CODE HERE ...
});

module.exports = router;
//**************************************
SECTION_END
/**************************************************************************
* Name: edge_wrapper.js
* Author: <%= AUTHOR %>
* Description: Edges wrapper class file
**************************************************************************/

var EdgesWrapper = function( connection )
{
  this.db = connection.db;
}

<% $edgesStack.each do |edge| %>
  EdgesWrapper.prototype.<%= edge %> = function( inCluster, outCluster ){
    // Saving the edge in class <%= edge %>
    this.db.create( 'EDGE', '<%= edge %>' ).from( inCluster ).to( outCluster ).one().then(function( edge ){
     console.log('created edge:', edge);
    });
  }
<% end %>

module.exports = EdgesWrapper;
