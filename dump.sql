create class User extends V
create class uSettings extends User
create property uSettings.firstName STRING
create property uSettings.lastName STRING
create property uSettings.userName STRING
create property uSettings.uid STRING
create property uSettings.userRole STRING
create property uSettings.email STRING
create property uSettings.token STRING
create property uSettings.secret STRING
create property uSettings.signinData DATETIME
create property uSettings.userKey STRING
create property uSettings.picture  STRING
create property uSettings.coverPage STRING
create property uSettings.timeZone EMBEDDED
create property uSettings.currency EMBEDDED
create property uSettings.location STRING
create property uSettings.websiteBlog STRING
create property uSettings.buyerRank SHORT
create property uSettings.sellerRank SHORT
create property uSettings.blockUser EMBEDDEDLIST String
create property uSettings.blockedBy EMBEDDEDLIST String
create property uSettings.askingInstrument STRING
create property uSettings.askedInstrument STRING
create class uPrivacy extends User
create property uPrivacy.StdAllowContact BOOLEAN
create property uPrivacy.StdAllowBrowseCollection BOOLEAN
create property uPrivacy.StdAllowBrowseWantlist BOOLEAN
create property uPrivacy.ExtPostReview BOOLEAN
create property uPrivacy.ExtSubmitInstr2Db BOOLEAN
create property uPrivacy.ExtAddInstr2Collection EMBEDDED
create property uPrivacy.ExtAddInstr2Wantlist EMBEDDED
create class uBuySell extends User
create property uBuySell.companyName STRING
create property uBuySell.userType BOOLEAN
create property uBuySell.vat STRING
create property uBuySell.address STRING
create property uBuySell.city EMBEDDED
create property uBuySell.country EMBEDDED
create property uBuySell.state EMBEDDED
create property uBuySell.zip EMBEDDED
create property uBuySell.phone STRING
create property uBuySell.paymentMethod EMBEDDEDLIST String
create property uBuySell.listingCurrency EMBEDDEDLIST String
create property uBuySell.shippingTerms STRING
create property uBuySell.paypalMail STRING
create class uPost extends User
create property uPost.postTitle STRING
create property uPost.postSubtitle STRING
create property uPost.postUser STRING
create property uPost.postDate DATETIME
create property uPost.postText STRING
create property uPost.postModify STRING
create property uPost.postModifyDate DATETIME
create property uPost.postPhoto STRING
create property uPost.postVideo STRING
create property uPost.postLink STRING
create property uPost.postLatLong EMBEDDEDMAP Double
create property uPost.postLike STRING
create property uPost.postLikeUserId STRING
create property uPost.postVote STRING
create property uPost.postVoteUserId STRING
create property uPost.postHelpful STRING
create property uPost.postHelpfulUserId STRING
create class uContribution extends User
create property uContribution.contribTitle STRING
create property uContribution.contribSubtitle STRING
create property uContribution.contribUser STRING
create property uContribution.contribDate DATETIME
create property uContribution.contribText STRING
create property uContribution.contribModify STRING
create property uContribution.contribModifyDate DATETIME
create property uContribution.contribPhoto STRING
create property uContribution.contribVideo STRING
create property uContribution.contribLink STRING
create property uContribution.contribLatLong EMBEDDEDMAP Double
create property uContribution.contribLike STRING
create property uContribution.contribLikeUserId STRING
create property uContribution.contribVote STRING
create property uContribution.contribVoteUserId STRING
create property uContribution.contribHelpful STRING
create property uContribution.contribHelpfulUserId STRING
create class Marketplace extends V
create property Marketplace.instrumentId SHORT
create property Marketplace.price SHORT
create property Marketplace.condition EMBEDDEDLIST
create property Marketplace.date DATETIME
create property Marketplace.isAsked SHORT
create property Marketplace.qty SHORT
create property Marketplace.shippingStart DATETIME
create property Marketplace.shippingEnd DATETIME
create property Marketplace.buyerRankPost STRING
create property Marketplace.buyerRankOrdId SHORT
create property Marketplace.buyerRankVote SHORT
create property Marketplace.sellerRankPost STRING
create property Marketplace.sellerRankOrdId SHORT
create property Marketplace.sellerRankVote SHORT
create class Logging extends User
create class Session extends Logging
create property Session.sessionStart DATETIME
create property Session.sessionStop DATETIME
create property Session.clickedItem STRING
create property Session.itemModification STRING
create property Session.latLong EMBEDDEDMAP Double
create property Session.browserUsed STRING
create property Session.accessbyAppDevice STRING
create class uNotify extends V
create property uNotify.AccGubaAnnounce BOOLEAN
create property uNotify.AccUsrMsg2Me BOOLEAN
create property uNotify.AccRplForumwatching BOOLEAN
create property uNotify.AccRplGroupwatching BOOLEAN
create property uNotify.AccMentionInForum BOOLEAN
create property uNotify.AccMentionInBlog BOOLEAN
create property uNotify.MktWantInstrIsInSale BOOLEAN
create property uNotify.MktNeedOrderFeedback BOOLEAN
create property uNotify.MktMycartNoAvail BOOLEAN
create property uNotify.MktMyOrderStatus BOOLEAN
create property uNotify.DbSubmChanged BOOLEAN
create property uNotify.DbInstrCollChanged BOOLEAN
create property uNotify.DbInstrInventChanged BOOLEAN
create property uNotify.DbContributeChanged BOOLEAN
create property uNotify.DbListUpdate BOOLEAN
create property uNotify.NewsContrStatistics BOOLEAN
create property uNotify.NewsSellingStatistics BOOLEAN
create property uNotify.NewsBuyingStatistics BOOLEAN
create class Country extends V
create property Country.code STRING 
create class Material extends V
create property Material.name STRING
create class Model extends V
create property Model.name STRING
create class Brand extends V
create property Brand.name STRING
create class sInstrumentType extends V  
create property sInstrumentType.name STRING 
create class sInstrumentSound extends V 
create property sInstrumentSound.name STRING    
create class sInstrumentVoice extends V 
create property sInstrumentVoice.name STRING    
create class Instruments extends V
create property Instruments.year SHORT
create property Instruments.sOutputNumber EMBEDDEDLIST String
create property Instruments.conditionScale STRING
create class CircuitType extends Instruments
create property CircuitType.type STRING
create class VolumePot extends Instruments
create property VolumePot.Operation STRING
create class Strings extends Instruments
create property Strings.sStrings SHORT
create property Strings.sJackInsertion STRING
create class sBody extends Instruments
create property sBody.bodyType STRING 
create property sBody.paintType STRING
create property sBody.paintColor STRING 
create class sNeck extends Instruments
create property sNeck.joint STRING  
create property sNeck.sense STRING  
create property sNeck.sScaleLenght STRING
create class sFretboard extends Instruments
create property sFretboard.fretsNumber SHORT
create property sFretboard.inlays STRING
create property sFretboard.freatless BOOLEAN
create property sFretboard.scalloped BOOLEAN
create property sFretboard.scallopedFrets SHORT 
create property sFretboard.w1 DOUBLE
create property sFretboard.w2 DOUBLE
create property sFretboard.h1 DOUBLE
create property sFretboard.h2 DOUBLE
create property sFretboard.r1 DOUBLE
create property sFretboard.r2 DOUBLE   
create property sFretboard.r3 DOUBLE   
create property sFretboard.r4 DOUBLE
create class sPickUp extends Instruments    
create property sPickUp.type STRING
create property sPickUp.operation BOOLEAN
create property sPickUp.split BOOLEAN
create property sPickUp.magnetMaterial STRING
create property sPickUp.voltageOutput DOUBLE
create property sPickUp.resonantFrequency DOUBLE
create property sPickUp.impedance DOUBLE   
create property sPickUp.position STRING
create property sPickUp.selector EMBEDDEDLIST String
create property sPickUp.combinations EMBEDDEDLIST String
create class sTuningKey extends Instruments
create property sTuningKey.locking BOOLEAN
create property sTuningKey.screw BOOLEAN
create property sTuningKey.ratio EMBEDDEDLIST Short
create class sBridge extends Instruments
create property sBridge.type STRING
create property sBridge.historicalOptions STRING    
create class sPots extends Instruments
create property sPots.operationType STRING
create property sPots.ohmValue DOUBLE
create property sPots.function STRING
create property sPots.type STRING   
create class Keyboards extends Instruments
create class Amplifiers extends Instruments
create property Amplifiers.aDomain BOOLEAN
create property Amplifiers.aSystem STRING
create property Amplifiers.aAssembly STRING
create property Amplifiers.aFunctionality STRING
create property Amplifiers.inputPowerWatt STRING
create property Amplifiers.channels STRING
create property Amplifiers.output STRING
create property Amplifiers.outputType BOOLEAN
create property Amplifiers.SerialNumber STRING
create class aHardware extends Amplifiers
create property aHardware.tolexType EMBEDDEDLIST String
create property aHardware.clothType  EMBEDDEDLIST String
create property aHardware.headphoneOut BOOLEAN
create property aHardware.chassisType STRING
create property aHardware.chokeType STRING
create property aHardware.troubleIndicator STRING
create property aHardware.linkableChannel BOOLEAN 
create class aConfiguration extends Amplifiers
create property aConfiguration.integratedEffects BOOLEAN
create property aConfiguration.masterVolume BOOLEAN
create property aConfiguration.channelFootSwitch BOOLEAN
create property aConfiguration.powerSplitSwitch BOOLEAN
create property aConfiguration.preAmpOut BOOLEAN
create property aConfiguration.externalAmpIn BOOLEAN
create property aConfiguration.availableInput STRING
create property aConfiguration.inputLevel BOOLEAN
create property aConfiguration.passiveActiveInput BOOLEAN
create property aConfiguration.tunerOutput BOOLEAN
create property aConfiguration.gainOverdrive EMBEDDEDLIST Short
create class aSoundsculpture extends Amplifiers
create property aSoundsculpture.simulator BOOLEAN
create property aSoundsculpture.equalizerwrkFreq EMBEDDEDLIST Short
create property aSoundsculpture.equalizerwrkBand EMBEDDEDLIST Short
create property aSoundsculpture.equalizerPad EMBEDDEDLIST Short
create property aSoundsculpture.tremolo EMBEDDEDLIST Short
create property aSoundsculpture.reverb EMBEDDEDLIST Short
create property aSoundsculpture.send STRING
create property aSoundsculpture.return STRING
create property aSoundsculpture.returnMonoStereo BOOLEAN
create property aSoundsculpture.boostBriteSwitch BOOLEAN
create property aSoundsculpture.boostFatSwitch BOOLEAN
create property aSoundsculpture.boostMiddleSwitch BOOLEAN
create property aSoundsculpture.rectifierType STRING
create class aElectric extends Amplifiers
create property aElectric.loadImpedance STRING
create property aElectric.transformersPower BOOLEAN
create property aElectric.transformersOutput BOOLEAN
create property aElectric.groundSwitch BOOLEAN
create property aElectric.biasRegulation BOOLEAN
create property aElectric.standByPowerSwitch BOOLEAN
create property aElectric.ScreenGreedResistors BOOLEAN 
create property aElectric.ScreenGreedResistorsVal SHORT
create property aElectric.VolumePotCapacitor STRING
create property aElectric.ToneStack EMBEDDEDLIST Short
create property aElectric.electrolyticCapacitorsDimensions EMBEDDEDLIST Short
create property aElectric.electrolyticCapacitorsFarad SHORT
create property aElectric.electrolyticCapacitorsVolt SHORT
create property aElectric.electrolyticCapacitorsType STRING
create property aElectric.maxPowerOutput STRING
create property aElectric.powerConsumption STRING
create property aElectric.operatingVoltage STRING
create property aElectric.V1CathodeType BOOLEAN
create property aElectric.powerCordType STRING
create property aElectric.impedanceSelectorType STRING
create property aElectric.mainsSelectorType STRING
create property aElectric.circuitBoardType STRING
create property aElectric.standbySwitchType STRING
create property aElectric.powerSwitchType STRING
create property aElectric.polaritySwitchType STRING
create property aElectric.fuseHolderType STRING
create property aElectric.biasCircuitType STRING
create property aElectric.schema STRING
create class aTubes extends Amplifiers
create property aTubes.preTubes EMBEDDEDLIST String
create property aTubes.preTubesQty EMBEDDEDLIST String
create property aTubes.aPowerTubes EMBEDDEDLIST String
create property aTubes.aPowerTubesQty EMBEDDEDLIST String
create property aTubes.aRectifierTube BOOLEAN 
create property aTubes.aRectifierTubeType EMBEDDEDLIST String
create property aTubes.aTransistor STRING
create property aTubes.aMosfet STRING
create property aTubes.aOperational STRING
create class aCabinet extends Amplifiers
create property aCabinet.aCSpeakersNumber STRING
create property aCabinet.aCSpeakersSize EMBEDDEDLIST String
create property aCabinet.aCInputQty STRING
create property aCabinet.aCInputType EMBEDDEDLIST String
create property aCabinet.aCDimensions EMBEDDEDLIST Short
create property aCabinet.aCWeight STRING
create property aCabinet.aCTotalWattage STRING
create property aCabinet.aCGlobalCabinetImpedance STRING
create property aCabinet.aCTolexType EMBEDDEDLIST String
create property aCabinet.aCclothType  EMBEDDEDLIST String
create class aSpeakers extends Amplifiers
create property aSpeakers.aSNominalDiameter SHORT
create property aSpeakers.aSPowerRating SHORT
create property aSpeakers.aSNominalImpedance SHORT
create property aSpeakers.aSSensitivity SHORT
create property aSpeakers.aSChassisType STRING
create property aSpeakers.aSVoiceCoilDiameter SHORT
create property aSpeakers.aSVoiceCoilMaterial SHORT
create property aSpeakers.aSMagnetType STRING
create property aSpeakers.aSMagnetWeight SHORT
create property aSpeakers.aSFrequencyRange EMBEDDEDLIST Short
create property aSpeakers.aSResonanceFrequency SHORT
create property aSpeakers.aSDCResistance SHORT
create property aSpeakers.aSCutOutDiameter SHORT
create property aSpeakers.aSDiameter SHORT
create property aSpeakers.aSMagnetStructureDiameter SHORT
create property aSpeakers.aSMountingSlotDimensions EMBEDDEDLIST Short
create property aSpeakers.aSMountingSlotPCD EMBEDDEDLIST Short
create property aSpeakers.aSNumberMountingSlots SHORT
create property aSpeakers.aSOverallDepth SHORT
create property aSpeakers.aSUnitWeight SHORT
create property aSpeakers.aSerialNumber STRING
create class Microphones extends Instruments
create property Microphones.mVarieties EMBEDDEDLIST String
create property Microphones.mPolarPatterns String
create property Microphones.mApplication String
create property Microphones.mPowering EMBEDDEDLIST String
create property Microphones.mSupplyVoltage EMBEDDEDLIST String
create property Microphones.mConnectors EMBEDDEDLIST String
create property Microphones.mUsb BOOLEAN
create property Microphones.mImpedance DOUBLE
create property Microphones.mRecommendedLoadImpedance DOUBLE
create property Microphones.PhaseInversion BOOLEAN
create property Microphones.mDigitalInterface STRING
create property Microphones.FrequencyResponseFrom DOUBLE
create property Microphones.FrequencyResponseTo DOUBLE
create property Microphones.ResponseCurves STRING
create property Microphones.mSensitivity DOUBLE
create property Microphones.mMxSpl DOUBLE
create property Microphones.mThd SHORT
create property Microphones.mSignalNoiseRatio DOUBLE
create property Microphones.mEquivalentNoiseLevel DOUBLE
create property Microphones.mRollOffSwitchOption BOOLEAN 
create property Microphones.mRollOffSwitchValues STRING
create property Microphones.mAttenuationSwitchOption BOOLEAN
create property Microphones.mAttenuationSwitchValues STRING
create property Microphones.mCurrentConsumption SHORT
create class Effects extends Instruments
create property Effects.eFormatHeight SHORT
create property Effects.eFormatWidth SHORT
create property Effects.eFormatDepth SHORT
create property Effects.eFormatWeight SHORT
create property Effects.eFormatStompbox EMBEDDEDLIST String
create property Effects.eFormatRack STRING
create property Effects.eSD BOOLEAN
create property Effects.eUSB BOOLEAN
create property Effects.eUSBType STRING
create property Effects.ePower STRING
create property Effects.ePowerBattery BOOLEAN
create property Effects.eOperatingVoltage SHORT
create property Effects.ePolarity BOOLEAN
create property Effects.eExternalControl BOOLEAN
create property Effects.eTruebyPass BOOLEAN
create property Effects.eInput BOOLEAN
create property Effects.eOutput BOOLEAN
create property Effects.eGainLevelControl SHORT
create property Effects.eMidi BOOLEAN
create property Effects.eLoop BOOLEAN
create property Effects.eCurrentDraw SHORT
create property Effects.eImpedanceInput SHORT
create property Effects.eImpedanceOutput SHORT
create property Effects.eSerialNumber STRING
create property Effects.eVolume SHORT
create class ePreamp extends Effects
create class eBooster extends ePreamp
create property eBooster.switch BOOLEAN
create property eBooster.volume EMBEDDEDLIST Short
create class eBuffer extends ePreamp
create property eBuffer.switch BOOLEAN
create class eCompressor extends ePreamp
create property eCompressor.threshold EMBEDDEDLIST Short
create property eCompressor.ratio EMBEDDEDLIST Short
create property eCompressor.attack EMBEDDEDLIST Short
create property eCompressor.release EMBEDDEDLIST Short
create class eOverdrive extends ePreamp
create property eOverdrive.distortion SHORT
create property eOverdrive.distortionAsymSym BOOLEAN
create class eDistortion extends ePreamp
create property eDistortion.distortion SHORT
create property eDistortion.distortionAsymSym BOOLEAN
create class eFuzz extends ePreamp
create property eFuzz.distortion SHORT
create property eFuzz.distortionAsymSym BOOLEAN
create class eModeler extends ePreamp
create property eModeler.type STRING
create class ePreamplifier extends ePreamp
create property ePreamplifier.levelInput BYTE
create property ePreamplifier.instrumentLevel SHORT
create property ePreamplifier.lineLevel SHORT
create class eEqualizer extends ePreamp
create property eEqualizer.type STRING
create property eEqualizer.typeGraphic EMBEDDEDLIST Double
create property eEqualizer.typeParametric EMBEDDEDLIST Double
create property eEqualizer.typeSemiParametric EMBEDDEDLIST Double
create class eModulation extends Effects
create class eWha extends eModulation
create property eWha.switch BOOLEAN
create property eWha.otherInput BOOLEAN
create class eVibrato extends eModulation
create property eVibrato.rate EMBEDDEDLIST Short
create property eVibrato.depth EMBEDDEDLIST Short
create property eVibrato.delay EMBEDDEDLIST Short
create class eChorus extends eModulation
create property eChorus.numberOfVoices SHORT
create property eChorus.ratePeriod EMBEDDEDLIST Short
create property eChorus.depthAmplitudeIntensity EMBEDDEDLIST Short
create property eChorus.preDelay EMBEDDEDLIST Short
create property eChorus.toneControl EMBEDDEDLIST Short
create property eChorus.intensityDryWet EMBEDDEDLIST Short
create property eChorus.lfoWaveForm STRING
create property eChorus.lfoFrequency EMBEDDEDLIST Short
create class eRotary extends eModulation
create property eRotary.speedRateMinMax EMBEDDEDLIST Short
create property eRotary.stereo SHORT
create property eRotary.lowHighBalance EMBEDDEDLIST Short
create property eRotary.mix EMBEDDEDLIST Short
create class eFlanger extends eModulation
create property eFlanger.depthRange EMBEDDEDLIST Short
create property eFlanger.speedRate EMBEDDEDLIST Short
create property eFlanger.manual EMBEDDEDLIST Short
create property eFlanger.regen SHORT
create property eFlanger.mix EMBEDDEDLIST Short
create property eFlanger.delay EMBEDDEDLIST Short
create class ePhaser extends eModulation
create property ePhaser.lfoSpeed EMBEDDEDLIST Short
create property ePhaser.lfoDepthIntensity EMBEDDEDLIST Short
create property ePhaser.lfoDepthAmplitude EMBEDDEDLIST Short
create property ePhaser.resonance EMBEDDEDLIST Short
create property ePhaser.numberOfFilters EMBEDDEDLIST String
create property ePhaser.mixWetDry EMBEDDEDLIST Short
create class eDelay extends eModulation
create property eDelay.level EMBEDDEDLIST Short
create property eDelay.feedback EMBEDDEDLIST Short 
create property eDelay.delayTime EMBEDDEDLIST Short 
create property eDelay.type BOOLEAN
create class eReverb extends eModulation
create property eReverb.mix EMBEDDEDLIST Short
create property eReverb.decay EMBEDDEDLIST Short
create class eOctaver extends eModulation
create property eOctaver.octaveQty EMBEDDEDLIST Short
create property eOctaver.filter EMBEDDEDLIST Short
create property eOctaver.mixBlend EMBEDDEDLIST Short
create class eVocoder extends eModulation
create property eVocoder.tone EMBEDDEDLIST Short
create property eVocoder.mixBlend EMBEDDEDLIST Short
create property eVocoder.pitch EMBEDDEDLIST Short
create class ePitchshifter extends eModulation
create property ePitchshifter.mix EMBEDDEDLIST Short
create property ePitchshifter.voices EMBEDDEDLIST Short
create property ePitchshifter.envelope EMBEDDEDLIST Short
create property ePitchshifter.feedback EMBEDDEDLIST Short
create property ePitchshifter.filter EMBEDDEDLIST Short
create class eHarmonizer extends eModulation
create property eHarmonizer.mix EMBEDDEDLIST Short
create property eHarmonizer.voices EMBEDDEDLIST Short
create property eHarmonizer.envelope EMBEDDEDLIST Short
create property eHarmonizer.feedback EMBEDDEDLIST Short
create property eHarmonizer.filter EMBEDDEDLIST Short
create class eRouting extends Effects
create class eNoisegate extends eRouting
create property eNoisegate.threshold EMBEDDEDLIST Short
create property eNoisegate.decay EMBEDDEDLIST Short
create class eLooper extends eRouting
create property eLooper.totalLoops EMBEDDEDLIST Short
create property eLooper.maxRecordingTime Short
create property eLooper.quantize BOOLEAN
create property eLooper.recordingTracks EMBEDDEDLIST Short
create class eTuner extends eRouting
create property eTuner.Type STRING 
create class eSwitch extends eRouting
create property eSwitch.channelInputOutput EMBEDDEDLIST Short
create class Drums extends Instruments
create class dTom extends Drums
create property dTom.dSize EMBEDDEDLIST Short
create property dTom.dMaterial STRING
create property dTom.dHoopsSize EMBEDDEDLIST String
create property dTom.dHoopsMaterial STRING
create class dSkin extends dTom 
create property dSkin.type STRING
create class dCymbal extends Drums
create property dCymbal.type STRING
create property dCymbal.dCSize STRING
create property dCymbal.dCCopperPercentage STRING
create property dCymbal.dCWeight STRING
create property dCymbal.dCMaking STRING
create property dCymbal.dCFinishing STRING
create class dStickBrush extends Drums
create property dStickBrush.type  STRING
create property dStickBrush.size  STRING
create property dStickBrush.dSTipMaterial STRING
create property dStickBrush.dSTipShape STRING
create class dHardware extends Drums
create property dHardware.dPedalType STRING
create property dHardware.dSuspensionSystem STRING
create class hasRating extends E
create property hasRating.text String
create property hasRating.rate Short
create property hasRating.on DateTime
create class hasBrand extends E
create class hasModel extends E
create class hasType extends E  
create class isMadeBy extends E
create property isMadeBy.part STRING    
create class materialType extends E
create class isMadeIn extends E 
create class isComposedBy extends E
create class thatIs extends E
create class amplifiedBy extends E
create class hasTubes extends E
create class hasHardware extends E
create class hasConfiguration extends E
create class hasSoundSculture extends E
create class hasElectric extends E
create class hasCabinet extends E
create class hasSpeaker extends E
create class effectedBy extends E
create class withPreEffect extends E
create class withModulationEffect extends E
create class withRoutingEffect extends E
create class hasBooster extends E
create class hasBuffer extends E
create class hasCompressor extends E
create class hasDistortion extends E
create class hasOverdrive extends E
create class hasFuzz extends E
create class hasModeler extends E
create class hasPreamplifier extends E
create class hasEqualizer extends E
create class hasWha extends E
create class hasVibrato extends E
create class hasChorus extends E
create class hasRotary extends E
create class hasRanger extends E
create class hasPhaser extends E
create class hasDelayecho extends E
create class hasReverb extends E
create class hasOctaver extends E
create class hasVocoder extends E
create class hasPitchshifter extends E
create class hasHarmonizer extends E
create class hasNoiseGate extends E
create class hasLooper extends E
create class hasTuner extends E
create class hasSwitch extends E
create class percussionBy extends E
create class hasCymbals extends E
create class hasTom extends E
create class hasStick extends E
create class hasSkin extends E
create class ownsInstrument extends E
create class wantsInstrument extends E
create class contributedTo extends E
create class commentedFor extends E
create class hasLogged extends E
create class wantsReceive extends E
create class hasSetting extends E
create class hasPrivacy extends E
create class buySells extends E
create class hasPosted extends E
create class hasContributed extends E
create class withValue extends E
create class marketIt extends E