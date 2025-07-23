=== LockIn.ModAmpSet
Sets the modulation amplitude of the specified Lock-In modulator.
==== Arguments:

Modulator number [int] is the number that specifies which modulator to use. It starts from number 1 (=Modulator 1)

Amplitude (V) [float32] is the modulation amplitude of the specified Lock-In modulator
==== Return arguments:

Error described in the Response message>Body section

=== LockIn.ModAmpGet
Returns the modulation amplitude of the specified Lock-In modulator.
==== Arguments:

Modulator number [int] is the number that specifies which modulator to use. It starts from number 1 (=Modulator 1)
==== Return arguments:

Amplitude (V) [float32] is the modulation amplitude of the specified Lock-In modulator

Error described in the Response message>Body section

=== LockIn.ModPhasFreqSet
Sets the frequency of the specified phase register.
==== Arguments:

Phase register index [int] is the index of the phase register. Valid values are index 1 to 8

Frequency (Hz) [float32] is the frequency of the specified phase register
==== Return arguments:

Error described in the Response message>Body section

=== LockIn.ModPhasFreqGet
Returns the frequency of the specified phase register.
==== Arguments:

Phase register index [int] is the index of the phase register. Valid values are index 1 to 8
==== Return arguments:

Frequency (Hz) [float32] is the frequency of the specified phase register

Error described in the Response message>Body section

=== LockIn.DemodSignalSet
Selects the demodulated signal of the specified Lock-In demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)

Demodulator Signal Index [int] is the signal index out of the list of 128 signals available in the software. To get a list of the available signals, use the Signals.NamesGet function.
==== Return arguments:

Error described in the Response message>Body section

=== LockIn.DemodSignalGet
Returns the demodulated signal of the specified Lock-In demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)
==== Return arguments:

Demodulator Signal Index [int] is the signal index out of the list of 128 signals available in the software. To get a list of the available signals, use the Signals.NamesGet function

Error described in the Response message>Body section

=== LockIn.DemodHarmonicSet
Sets the harmonic of the specified Lock-In demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)

Harmonic [int] is the harmonic of the specified Lock-In demodulator. Valid values start from 1 (=base frequency)
==== Return arguments:

Error described in the Response message>Body section

=== LockIn.DemodHarmonicGet
Returns the harmonic of the specified Lock-In demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)
==== Return arguments:

Harmonic [int] is the harmonic of the specified Lock-In demodulator. Valid values start from 1 (=base frequency)

Error described in the Response message>Body section

=== LockIn.DemodHPFilterSet
Sets the high pass filter of the specified Lock-In demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)

High Pass Filter [unsigned int16] sets the high pass filter of the specified Lock-In demodulator. 0=no change, 1=Off, 2=On
==== Return arguments:

Error described in the Response message>Body section

=== LockIn.DemodHPFilterGet
Returns the high pass filter of the specified Lock-In demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)
==== Return arguments:

High Pass Filter [unsigned int16] is the high pass filter of the specified Lock-In demodulator. 0=Off, 1=On

Error described in the Response message>Body section

=== LockIn.DemodLPFilterSet
Sets the low pass filter of the specified Lock-In demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)

Low Pass Filter (Hz) [float32] sets the low pass filter frequency of the specified Lock-In demodulator

Filter Order [unsigned int16] sets the filter order. 0=no change, 1=1st order, 2=2nd order, 3=3rd order, 4=4th order
==== Return arguments:

Error described in the Response message>Body section

=== LockIn.DemodLPFilterGet
Returns the low pass filter of the specified Lock-In demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)
==== Return arguments:

Low Pass Filter (Hz) [float32] is the low pass filter frequency of the specified Lock-In demodulator

Filter Order [unsigned int16] is the filter order. 0=1st order, 1=2nd order, 2=3rd order, 3=4th order

Error described in the Response message>Body section

=== LockIn.DemodPhasRegSet
Sets the phase register index of the specified Lock-In demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)

Phase Register Index [int] is the index of the phase register of the specified Lock-In demodulator. Valid values are index 1 to 8
==== Return arguments:

Error described in the Response message>Body section

=== LockIn.DemodPhasRegGet
Returns the phase register index of the specified Lock-In demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)
==== Return arguments:

Phase Register Index [int] is the index of the phase register of the specified Lock-In demodulator. Valid values are index 1 to 8

Error described in the Response message>Body section

=== LockIn.DemodPhasSet
Sets the reference phase of the specified Lock-In demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)

Phase (deg) [float32] is the reference phase of the specified Lock-In demodulator
==== Return arguments:

Error described in the Response message>Body section

=== LockIn.DemodPhasGet
Returns the reference phase of the specified Lock-In demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)
==== Return arguments:

Phase (deg) [float32] is the reference phase of the specified Lock-In demodulator

Error described in the Response message>Body section

=== LockIn.DemodSyncFilterSet
Switches the synchronous (Sync) filter of the specified demodulator On or Off.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)

Sync Filter [unsigned int32] switches the synchronous filter of the specified demodulator on or off, where 0=Off and 1=On
==== Return arguments:

Error described in the Response message>Body section

=== LockIn.DemodSyncFilterGet
Returns the status (on/off) of the synchronous (Sync) filter of the specified demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)
==== Return arguments:

Sync Filter [unsigned int32] is the synchronous filter of the specified demodulator, where 0=Off and 1=On

Error described in the Response message>Body section

=== LockIn.DemodRTSignalsSet
Sets the signals available for acquisition on the real-time system from the specified demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)

RT Signals [unsigned int32] sets which signals from the specified demodulator should be available on the Real-time system. 0 sets the available RT Signals to X/Y, 1 sets them to R/phi.
==== Return arguments:

Error described in the Response message>Body section

=== LockIn.DemodRTSignalsGet
Returns which the signals are available for acquisition on the real-time system from the specified demodulator.
==== Arguments:

Demodulator number [int] is the number that specifies which demodulator to use. It starts from number 1 (=Demodulator 1)
==== Return arguments:

RT Signals [unsigned int32] returns which signals from the specified demodulator are available on the Real-time system. 0 means X/Y, and 1 means R/phi.

Error described in the Response message>Body section

== Lock-In Frequency Sweep

=== LockInFreqSwp.Open
Opens the Transfer function (Lock-In Frequency Sweep) module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== LockInFreqSwp.Start
Starts a Lock-In frequency sweep.
==== Arguments:

Get Data [unsigned int32] defines if the function returns the recorder channels and data

Direction [unsigned int32] sets the direction of the frequency sweep. 0 means sweep down (from upper limit to lower limit) and 1 means sweep up (from lower limit to upper limit)
==== Return arguments:

Channels names size [int] is the size in bytes of the recorder channels names array

Channels names number [int] is the number of elements of the recorded channels names array

Channels names (1D array string) returns the array of recorded channel names (strings), where each string comes prepended by its size in bytes

Data rows [int] is the number of rows of the returned data array (the first row is the swept frequency, and each additional row contains the data of each recorded channel )

Data columns [int] is the number of recorded points (number of steps plus 1)

Data (2D array float32) returns the recorded data. The number of rows is defined by Data rows, and the number of columns is defined by Data columns

Error described in the Response message>Body section

=== LockInFreqSwp.SignalSet
Sets the sweep signal used in the Lock-In frequency sweep module.
==== Arguments:

Sweep signal index [int] sets the sweep signal index out of the list of sweep signals to use, where -1 means no signal selected
==== Return arguments:

Error described in the Response message>Body section

=== LockInFreqSwp.SignalGet
Returns the sweep signal used in the Lock-In frequency sweep module.
==== Arguments:

None
==== Return arguments:

Sweep signal index [int] is the sweep signal index selected out of the list of sweep signals, where -1 means no signal selected

Error described in the Response message>Body section

=== LockInFreqSwp.LimitsSet
Sets the frequency limits in the Lock-In frequency sweep module.
==== Arguments:

Lower limit (Hz) [float32] sets the lower frequency limit in Hz

Upper limit (Hz) [float32] sets the lower frequency limit in Hz
==== Return arguments:

Error described in the Response message>Body section

=== LockInFreqSwp.LimitsGet
Returns the frequency limits in the Lock-In frequency sweep module.
==== Arguments:

None
==== Return arguments:

Lower limit (Hz) [float32] is the lower frequency limit in Hz

Upper limit (Hz) [float32] is the lower frequency limit in Hz

Error described in the Response message>Body section

=== LockInFreqSwp.PropsSet
Sets the configuration of the Transfer Function (Lock-In frequency sweep) module.
==== Arguments:

Number of steps [unsigned int16] is the number of frequency steps over the sweep range (logarithmic distribution). The number of data points = number of steps + 1. If set to 0, the number of steps is left unchanged

Integration periods [unsigned int16] is the number of Lock in periods to average for one measurement.

Minimum integration time (s) [float32] is the minimum integration time in seconds to average each measurement

Settling periods [unsigned int16] is the number of Lock in periods to wait before acquiring data at each point of the sweep

Minimum Settling time (s) [float32] is the minimum settling time in seconds to wait before acquiring data at each point of the sweep

Autosave [unsigned int32] automatically saves the data at end of sweep

Save dialog [unsigned int32] will open a dialog box when saving the data

Basename size [int] is the size (number of characters) of the basename string

Basename [string] is the basename of the saved files
==== Return arguments:

Error described in the Response message>Body section

=== LockInFreqSwp.PropsGet
Returns the configuration of the Transfer Function (Lock-In frequency sweep) module.
==== Arguments:

None
==== Return arguments:

Number of steps [unsigned int16] is the number of frequency steps over the sweep range (logarithmic distribution). The number of data points = number of steps + 1

Integration periods [unsigned int16] is the number of Lock in periods to average for one measurement.

Minimum integration time (s) [float32] is the minimum integration time in seconds to average each measurement

Settling periods [unsigned int16] is the number of Lock in periods to wait before acquiring data at each point of the sweep

Minimum Settling time (s) [float32] is the minimum settling time in seconds to wait before acquiring data at each point of the sweep

Autosave [unsigned int32] automatically saves the data at end of sweep

Save dialog [unsigned int32] will open a dialog box when saving the data

Basename size [int] is the size (number of characters) of the basename string

Basename [string] is the basename of the saved files

Error described in the Response message>Body section

== PLL modules

=== PLL.InpCalibrSet
Sets the input calibration and offset of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Calibration [float32]

Offset [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLL.InpCalibrGet
Returns the input calibration and offset of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Calibration [float32]

Offset [float32]

Error described in the Response message>Body section

=== PLL.InpRangeSet
Sets the input range of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Range (V) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLL.InpRangeGet
Returns the input range of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Range (V) [float32]

Error described in the Response message>Body section

=== PLL.InpPropsSet
Sets the input properties of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

AC coupling [unsigned int16] sets the AC coupling. 0=no change, 1=On, 2=Off

Input impedance [unsigned int16] sets the input impedance. 0=no change, 1=50 Ohm, 2=1 MOhm

High pass filter (Hz) [float32] sets the high pass filter frequency

Low pass filter (Hz) [float32] sets the low pass filter frequency
==== Return arguments:

Error described in the Response message>Body section

=== PLL.InpPropsGet
Returns the input properties of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

AC coupling [unsigned int16] is the AC coupling status. 0=Off, 1=On

Input impedance [unsigned int16] is the input impedance. 0=50 Ohm, 1=1 MOhm

High pass filter (Hz) [float32] is the high pass filter frequency

Low pass filter (Hz) [float32] is the low pass filter frequency

Error described in the Response message>Body section

=== PLL.AddOnOffSet
Switches the Add switch of the selected PLL on or off.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Add On/Off [unsigned int16] switches the Add switch on or off. 0=no change, 1=On, 2=Off
==== Return arguments:

Error described in the Response message>Body section

=== PLL.AddOnOffGet
Returns the status of the Add switch of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Add On/Off [unsigned int16] is the status of the Add switch. 0=Off, 1=On

Error described in the Response message>Body section

=== PLL.OutOnOffSet
Switches the output of the selected PLL on or off.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Output On/Off [unsigned int16] switches the output on or off. 0=no change, 1=On, 2=Off
==== Return arguments:

Error described in the Response message>Body section

=== PLL.OutOnOffGet
Returns the status of the output of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Output On/Off [unsigned int16] is the status of the output. 0=Off, 1=On

Error described in the Response message>Body section

=== PLL.ExcRangeSet
Sets the excitation range of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Range (V) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLL.ExcRangeGet
Returns the excitation range of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Range (V) [float32]

Error described in the Response message>Body section

=== PLL.ExcitationSet
Sets the excitation of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Excitation (V) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLL.ExcitationGet
Returns the excitation of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Excitation (V) [float32]

Error described in the Response message>Body section

=== PLL.AmpCtrlSetpntSet
Sets the amplitude control setpoint of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Setpoint (V) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLL.AmpCtrlSetpntGet
Returns the amplitude control setpoint of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Setpoint (V) [float32]

Error described in the Response message>Body section

=== PLL.AmpCtrlOnOffSet
Switches the amplitude control of the selected PLL on or off.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Amplitude control On/Off [unsigned int16] switches the amplitude control on or off. 0=no change, 1=On, 2=Off
==== Return arguments:

Error described in the Response message>Body section

=== PLL.AmpCtrlOnOffGet
Returns the status of the amplitude control of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Amplitude control On/Off [unsigned int16] is the status of the amplitude control. 0=Off, 1=On

Error described in the Response message>Body section

=== PLL.AmpCtrlGainSet
Sets the amplitude control gain of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

P-gain [float32]

Time constant (s) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLL.AmpCtrlGainGet
Returns the amplitude control gain of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

P-gain [float32]

Time constant (s) [float32]

Error described in the Response message>Body section

=== PLL.AmpCtrlBandwidthSet
Sets the amplitude control bandwidth of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Bandwidth (Hz) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLL.AmpCtrlBandwidthGet
Returns the amplitude control bandwidth of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Bandwidth (Hz) [float32]

Error described in the Response message>Body section

=== PLL.PhasCtrlOnOffSet
Switches the phase control of the selected PLL on or off.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Phase control On/Off [unsigned int16] switches the phase control on or off. 0=no change, 1=On, 2=Off
==== Return arguments:

Error described in the Response message>Body section

=== PLL.PhasCtrlOnOffGet
Returns the status of the phase control of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Phase control On/Off [unsigned int16] is the status of the phase control. 0=Off, 1=On

Error described in the Response message>Body section

=== PLL.PhasCtrlGainSet
Sets the phase control gain of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

P-gain [float32]

Time constant (s) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLL.PhasCtrlGainGet
Returns the phase control gain of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

P-gain [float32]

Time constant (s) [float32]

Error described in the Response message>Body section

=== PLL.PhasCtrlBandwidthSet
Sets the phase control bandwidth of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Bandwidth (Hz) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLL.PhasCtrlBandwidthGet
Returns the phase control bandwidth of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Bandwidth (Hz) [float32]

Error described in the Response message>Body section

=== PLL.FreqRangeSet
Sets the frequency range of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Range (Hz) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLL.FreqRangeGet
Returns the frequency range of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Range (Hz) [float32]

Error described in the Response message>Body section

=== PLL.CenterFreqSet
Sets the center frequency of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Center frequency (Hz) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLL.CenterFreqGet
Returns the center frequency of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Center frequency (Hz) [float32]

Error described in the Response message>Body section

=== PLL.FreqShiftSet
Sets the frequency shift of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Frequency shift (Hz) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLL.FreqShiftGet
Returns the frequency shift of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Frequency shift (Hz) [float32]

Error described in the Response message>Body section

=== PLL.FreqShiftAutoCenter
Automatically centers the frequency shift of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Error described in the Response message>Body section

=== PLL.FreqExcOverwriteSet
Sets the signals to overwrite the Frequency Shift and/or Excitation signals of the oscillation control module.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Excitation overwrite signal index [int]

Frequency overwrite signal index [int]
==== Return arguments:

Error described in the Response message>Body section

=== PLL.FreqExcOverwriteGet
Returns the signals to overwrite the Frequency Shift and/or Excitation signals of the oscillation control module.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Excitation overwrite signal index [int]

Frequency overwrite signal index [int]

Error described in the Response message>Body section

=== PLL.DemodInputSet
Sets the input and the frequency generator of the selected demodulator.
==== Arguments:

Demodulator index [unsigned int16] specifies which modulator or PLL to control. The valid values start from 1

Input [unsigned int16], where value 0 means no change

Frequency generator [unsigned int16], where value 0 means no change
==== Return arguments:

Error described in the Response message>Body section

=== PLL.DemodInputGet
Returns the input and the frequency generator of the selected demodulator.
==== Arguments:

Demodulator index [unsigned int16] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Input [unsigned int16]

Frequency generator [unsigned int16]

Error described in the Response message>Body section

=== PLL.DemodHarmonicSet
Sets which harmonic of the input signal is selected in the PLL lock-in of the selected demodulator.
==== Arguments:

Demodulator index [unsigned int16] specifies which modulator or PLL to control. The valid values start from 1

Harmonic [unsigned int16] sets the harmonic. 0=no change, 1=1st harmonic, 2=2nd harmonic, etc.
==== Return arguments:

Error described in the Response message>Body section

=== PLL.DemodHarmonicGet
Returns which harmonic of the input signal is selected in the PLL lock-in of the selected demodulator.
==== Arguments:

Demodulator index [unsigned int16] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Harmonic [unsigned int16] is the harmonic. 0=1st harmonic, 1=2nd harmonic, etc.

Error described in the Response message>Body section

=== PLL.DemodPhasRefSet
Sets the phase reference of the selected demodulator.
==== Arguments:

Demodulator index [unsigned int16] specifies which modulator or PLL to control. The valid values start from 1

Phase reference [unsigned int16] sets the phase reference. 0=no change, 1=Input, 2=Internal
==== Return arguments:

Error described in the Response message>Body section

=== PLL.DemodPhasRefGet
Returns the phase reference of the selected demodulator.
==== Arguments:

Demodulator index [unsigned int16] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Phase reference [unsigned int16] is the phase reference. 0=Input, 1=Internal

Error described in the Response message>Body section

=== PLL.DemodFilterSet
Sets the filter settings of the selected demodulator.
==== Arguments:

Demodulator index [unsigned int16] specifies which modulator or PLL to control. The valid values start from 1

Low pass filter (Hz) [float32] sets the low pass filter frequency

Filter order [unsigned int16] sets the filter order. 0=no change, 1=1st order, 2=2nd order, 3=3rd order, 4=4th order
==== Return arguments:

Error described in the Response message>Body section

=== PLL.DemodFilterGet
Returns the filter settings of the selected demodulator.
==== Arguments:

Demodulator index [unsigned int16] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Low pass filter (Hz) [float32] is the low pass filter frequency

Filter order [unsigned int16] is the filter order. 0=1st order, 1=2nd order, 2=3rd order, 3=4th order

Error described in the Response message>Body section

== PLL Q-Control

=== PLLQCtrl.AccessRequest
Requests access to the Q-Control of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Error described in the Response message>Body section

=== PLLQCtrl.AccessGet
Returns if the Q-Control of the selected PLL is accessible.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Access status [unsigned int32] indicates if the Q-Control is accessible. 0=Not Accessible, 1=Accessible

Error described in the Response message>Body section

=== PLLQCtrl.OnOffSet
Switches the Q-Control of the selected PLL on or off.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

On/Off [unsigned int16] switches the Q-Control on or off. 0=no change, 1=On, 2=Off
==== Return arguments:

Error described in the Response message>Body section

=== PLLQCtrl.OnOffGet
Returns the status of the Q-Control of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Status [unsigned int16] is the status of the Q-Control. 0=Off, 1=On

Error described in the Response message>Body section

=== PLLQCtrl.QGainSet
Sets the Q-Control gain of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

P-gain [float32]

Time constant (s) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLLQCtrl.QGainGet
Returns the Q-Control gain of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

P-gain [float32]

Time constant (s) [float32]

Error described in the Response message>Body section

=== PLLQCtrl.PhaseSet
Sets the Q-Control phase of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Phase (deg) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLLQCtrl.PhaseGet
Returns the Q-Control phase of the selected PLL.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Phase (deg) [float32]

Error described in the Response message>Body section

== PLL Frequency Sweep

=== PLLFreqSwp.Open
Opens the PLL Frequency Sweep module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== PLLFreqSwp.ParamsSet
Sets the parameters of the PLL Frequency Sweep module.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Number of points [unsigned int16] is the number of frequency points over the sweep range (logarithmic distribution). If set to 0, the number of points is left unchanged.

Integration periods [unsigned int16] is the number of PLL periods to average for one measurement.

Minimum integration time (s) [float32] is the minimum integration time in seconds to average each measurement.

Settling periods [unsigned int16] is the number of PLL periods to wait before acquiring data at each point of the sweep.

Minimum settling time (s) [float32] is the minimum settling time in seconds to wait before acquiring data at each point of the sweep.

Autosave [unsigned int32] automatically saves the data at end of sweep. 0=no change, 1=On, 2=Off.

Save dialog [unsigned int32] will open a dialog box when saving the data. 0=no change, 1=On, 2=Off.

Basename size [int] is the size (number of characters) of the basename string.

Basename [string] is the basename of the saved files.

Parameter estimation method for Q [unsigned int16] sets the method used to estimate the Q factor. 0=no change, 1=Phase Slope, 2=Fit.
==== Return arguments:

Error described in the Response message>Body section

=== PLLFreqSwp.ParamsGet
Returns the parameters of the PLL Frequency Sweep module.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Number of points [unsigned int16] is the number of frequency points over the sweep range (logarithmic distribution).

Integration periods [unsigned int16] is the number of PLL periods to average for one measurement.

Minimum integration time (s) [float32] is the minimum integration time in seconds to average each measurement.

Settling periods [unsigned int16] is the number of PLL periods to wait before acquiring data at each point of the sweep.

Minimum settling time (s) [float32] is the minimum settling time in seconds to wait before acquiring data at each point of the sweep.

Autosave [unsigned int32] automatically saves the data at end of sweep. 0=Off, 1=On.

Save dialog [unsigned int32] will open a dialog box when saving the data. 0=Off, 1=On.

Basename size [int] is the size (number of characters) of the basename string.

Basename [string] is the basename of the saved files.

Parameter estimation method for Q [unsigned int16] is the method used to estimate the Q factor. 0=Phase Slope, 1=Fit.

Error described in the Response message>Body section

=== PLLFreqSwp.Start
Starts a frequency sweep.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Get data [unsigned int32], where if true (=1), the function will return the recorded Channels, the Data and the Characteristic values

Sweep direction [unsigned int32], where if true (=1), the sweep is done from lower to upper limit, and if false (=0) is done from upper to lower limit.
==== Return arguments:

Channels names size [int] is the size in bytes of the Channels names string array

Number of channels [int] is the number of elements of the Channels names string array

Channels names (1D array string) returns the list of channels names. The size of each string item comes right before it as integer 32

Data rows [int] defines the number of rows of the Data array

Data columns [int] defines the number of columns of the Data array

Data (2D array float32) returns the data

Resonance frequency (Hz) [float64]

Q factor [float64]

Phase (deg) [float32] at the resonance frequency

Amplitude to excitation quotient (nm/mV) [float32]

Fit length [int] is the number of samples used to draw the fit line when the Parameter Estimation Method for Q is Phase Slope

Number of points [int] is the number of points distributed over the frequency range

Error described in the Response message>Body section

=== PLLFreqSwp.Stop
Stops the sweep in the PLL Frequency Sweep module.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Error described in the Response message>Body section

== PLL Phase Sweep

=== PLLPhasSwp.Start
Starts a phase sweep.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1

Get data [unsigned int32], where if true (=1), the function will return the recorded Channels and the Data
==== Return arguments:

Channels names size [int] is the size in bytes of the Channels names string array

Number of channels [int] is the number of elements of the Channels names string array

Channels names (1D array string) returns the list of channels names. The size of each string item comes right before it as integer 32

Data rows [int] defines the number of rows of the Data array

Data columns [int] defines the number of columns of the Data array

Data (2D array float32) returns the data

Error described in the Response message>Body section

=== PLLPhasSwp.Stop
Stops the sweep in the PLL Phase Sweep module.
==== Arguments:

Modulator index [int] specifies which modulator or PLL to control. The valid values start from 1
==== Return arguments:

Error described in the Response message>Body section

== PLL Signal Analyzer

=== PLLSignalAnlzr.Open
Opens the PLL Signal Analyzer.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== PLLSignalAnlzr.ChSet
Sets the channel of the PLL Signal Analyzer.
==== Arguments:

Channel index [int]
==== Return arguments:

Error described in the Response message>Body section

=== PLLSignalAnlzr.ChGet
Returns the channel of the PLL Signal Analyzer.
==== Arguments:

None
==== Return arguments:

Channel index [int]

Error described in the Response message>Body section

=== PLLSignalAnlzr.TimebaseSet
Sets the Time Base and Update Rate of the PLL Signal Analyzer.
==== Arguments:

Timebase (int) Base is the index out of the list of Time Base values. Use the PLLSignalAnlzr.TimebaseGet

Update rate (Hz) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== PLLSignalAnlzr.TimebaseGet
Returns the Time Base and Update Rate of the PLL Signal Analyzer.
==== Arguments:

None
==== Return arguments:

Timebase (int) Base is the index out of the list of Time Base values.

Update rate (Hz) [float32]

Timebase list size [int] is the size in bytes of the Timebase list string array

Timebase list number [int] is the number of elements of the Timebase list string array

Timebase list (1D array string) returns an array of Timebase values, where each string comes prepended by its size in bytes

Error described in the Response message>Body section

=== PLLSignalAnlzr.TrigAuto
Sets the trigger to auto in the PLL Signal Analyzer.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== PLLSignalAnlzr.TrigRearm
Rearms the trigger in the PLL Signal Analyzer.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== PLLSignalAnlzr.TrigSet
Sets the trigger configuration in the PLL Signal Analyzer.
==== Arguments:

Trigger mode [unsigned int16] sets the trigger mode, where 0=no change, 1=Immediate, and 2=Level

Trigger source [int] set the signal index on which the trigger works. The list of available signals is returned by the PLLSignalAnlzr.FFTPropsGet function

Trigger slope [unsigned int16] sets the triggering direction, where 0=no change, 1=Rising, and 2=Falling

Trigger level [float64] sets the trigger level

Trigger position (s) [float64] sets the trigger position

Arming mode [unsigned int16] sets whether the trigger is automatically (=2) or manually rearmed (=1). Value 0 means no change
==== Return arguments:

Error described in the Response message>Body section

=== PLLSignalAnlzr.TrigGet
Returns the trigger configuration in the PLL Signal Analyzer.
==== Arguments:

None
==== Return arguments:

Trigger mode [unsigned int16] sets the trigger mode, where 0=no change, 1=Immediate, and 2=Level

Trigger source [int] set the signal index on which the trigger works. The list of available signals is returned by the PLLSignalAnlzr.FFTPropsGet function

Trigger slope [unsigned int16] sets the triggering direction, where 0=no change, 1=Rising, and 2=Falling

Trigger level [float64] sets the trigger level

Trigger position (s) [float64] sets the trigger position

Arming mode [unsigned int16] sets whether the trigger is automatically (=2) or manually rearmed (=1). Value 0 means no change

Trigger source signals list size [int] is the size in bytes of the trigger source signals array

Trigger source signals list number [int] is the number of elements of the trigger source signals array

Trigger source signals list (1D array string) returns an array of trigger source signals, where each string comes prepended by its size in bytes

Error described in the Response message>Body section

=== PLLSignalAnlzr.OsciDataGet
Returns the oscilloscope graph data from the PLL Signal Analyzer.
==== Arguments:

None
==== Return arguments:

Data t0 [float64] is the timestamp of the 1st acquired point

Data dt [float64] is the time distance between two acquired points

Data Y size [int] is the number of data points in Data Y

Data Y (1D array float64) is the data acquired in the oscilloscope

Error described in the Response message>Body section

=== PLLSignalAnlzr.FFTPropsSet
Sets the configuration in the spectrum section of the PLL Signal Analyzer.
==== Arguments:

FFT window [unsigned int16] is the window function applied to the timed signal before calculating the

Number of averages [int] is the number of averages. 0 means no change.

Averaging type [unsigned int16] sets the averaging type. 0=no change, 1=RMS, 2=Vector.

Frequency range (Hz) [float64] sets the frequency range.

Resolution (Hz) [float64] sets the resolution.

AC coupling [unsigned int16] sets the AC coupling. 0=no change, 1=On, 2=Off.
==== Return arguments:

Error described in the Response message>Body section

=== PLLSignalAnlzr.FFTPropsGet
Returns the configuration in the spectrum section of the PLL Signal Analyzer.
==== Arguments:

None
==== Return arguments:

FFT window [unsigned int16] is the window function applied to the timed signal before calculating the

Number of averages [int] is the number of averages.

Averaging type [unsigned int16] is the averaging type. 0=RMS, 1=Vector.

Frequency range (Hz) [float64] is the frequency range.

Resolution (Hz) [float64] is the resolution.

AC coupling [unsigned int16] is the AC coupling. 0=Off, 1=On.

Error described in the Response message>Body section

=== PLLSignalAnlzr.FFTAvgRestart
Restarts the averaging in the spectrum section of the PLL Signal Analyzer.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== PLLSignalAnlzr.FFTDataGet
Returns the spectrum graph data from the PLL Signal Analyzer.
==== Arguments:

None
==== Return arguments:

Data f0 [float64] is the frequency of the 1st acquired point

Data df [float64] is the frequency distance between two acquired points

Data Y size [int] is the number of data points in Data Y

Data Y (1D array float64) is the data acquired in the spectrum section

Error described in the Response message>Body section

== PLL Zoom FFT

=== PLLZoomFFT.Open
Opens the PLL Zoom FFT module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== PLLZoomFFT.ChSet
Sets the channel of the PLL Zoom FFT module.
==== Arguments:

Channel index [int]
==== Return arguments:

Error described in the Response message>Body section

=== PLLZoomFFT.ChGet
Returns the channel of the PLL Zoom FFT module.
==== Arguments:

None
==== Return arguments:

Channel index [int]

Error described in the Response message>Body section

=== PLLZoomFFT.AvgRestart
Restarts the averaging in the PLL Zoom FFT module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== PLLZoomFFT.PropsSet
Sets the configuration of the PLL Zoom FFT module.
==== Arguments:

FFT window [unsigned int16] is the window function applied to the timed signal before calculating the

Number of averages [int] is the number of averages. 0 means no change.

Averaging type [unsigned int16] sets the averaging type. 0=no change, 1=RMS, 2=Vector.

Frequency range (Hz) [float64] sets the frequency range.

Resolution (Hz) [float64] sets the resolution.

AC coupling [unsigned int16] sets the AC coupling. 0=no change, 1=On, 2=Off.
==== Return arguments:

Error described in the Response message>Body section

=== PLLZoomFFT.PropsGet
Returns the configuration of the PLL Zoom FFT module.
==== Arguments:

None
==== Return arguments:

FFT window [unsigned int16] is the window function applied to the timed signal before calculating the

Number of averages [int] is the number of averages.

Averaging type [unsigned int16] is the averaging type. 0=RMS, 1=Vector.

Frequency range (Hz) [float64] is the frequency range.

Resolution (Hz) [float64] is the resolution.

AC coupling [unsigned int16] is the AC coupling. 0=Off, 1=On.

Error described in the Response message>Body section

=== PLLZoomFFT.DataGet
Returns the spectrum graph data from the PLL Zoom FFT module.
==== Arguments:

None
==== Return arguments:

Data f0 [float64] is the frequency of the 1st acquired point

Data df [float64] is the frequency distance between two acquired points

Data Y size [int] is the number of data points in Data Y

Data Y (1D array float64) is the data acquired in the spectrum section

Error described in the Response message>Body section

== OC Sync module

=== OCSync.AnglesSet
Sets the angles for the OC Sync module.
==== Arguments:

Angle 1 (deg) [float32]

Angle 2 (deg) [float32]

Angle 3 (deg) [float32]

Angle 4 (deg) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== OCSync.AnglesGet
Returns the angles for the OC Sync module.
==== Arguments:

None
==== Return arguments:

Angle 1 (deg) [float32]

Angle 2 (deg) [float32]

Angle 3 (deg) [float32]

Angle 4 (deg) [float32]

Error described in the Response message>Body section

=== OCSync.LinkAnglesSet
Links or unlinks the angles in the OC Sync module.
==== Arguments:

Link angles [unsigned int16] links (=1) or unlinks (=0) the angles.
==== Return arguments:

Error described in the Response message>Body section

=== OCSync.LinkAnglesGet
Returns the link status of the angles in the OC Sync module.
==== Arguments:

None
==== Return arguments:

Link angles [unsigned int16] indicates if the angles are linked (=1) or unlinked (=0).

Error described in the Response message>Body section

== Script

=== Script.Load
Loads a script file (.script) in the Script module.
==== Arguments:

File path size [int] is the number of characters of the File path string

File path [string] is the path of the .script file to load.
==== Return arguments:

Error described in the Response message>Body section

=== Script.Save
Saves the current script in the Script module into a script file (.script).
==== Arguments:

File path size [int] is the number of characters of the File path string

File path [string] is the path of the .script file to save.
==== Return arguments:

Error described in the Response message>Body section

=== Script.Deploy
Deploys the current script in the Script module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== Script.Undeploy
Undeploys the current script in the Script module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== Script.Run
Runs the current script in the Script module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== Script.Stop
Stops the current script in the Script module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== Script.ChsGet
Returns the list of channels used in the Script module.
==== Arguments:

None
==== Return arguments:

Number of channels [int] is the number of elements of the Channels names string array

Channels names (1D array string) returns the list of channels names. The size of each string item comes right before it as integer 32

Error described in the Response message>Body section

=== Script.ChsSet
Sets the list of channels used in the Script module.
==== Arguments:

Number of channels [int] is the number of elements of the Channels names string array

Channels names (1D array string) sets the list of channels names. The size of each string item comes right before it as integer 32
==== Return arguments:

Error described in the Response message>Body section

=== Script.DataGet
Returns the data of the channels used in the Script module.
==== Arguments:

None
==== Return arguments:

Data rows [int] defines the number of rows of the Data array

Data columns [int] defines the number of columns of the Data array

Data (2D array float32) returns the data

Error described in the Response message>Body section

=== Script.Autosave
Automatically saves the data from the Script module.
==== Arguments:

Autosave [unsigned int32] sets whether to automatically save the data. 0=no change, 1=On, 2=Off

Basename size [int] is the number of bytes of the Basename string

Basename [string] sets the basename of the saved files
==== Return arguments:

Error described in the Response message>Body section

== Interferometer

=== Interf.CtrlOnOffSet
Switches the Interferometer controller on or off.
==== Arguments:

Control On/Off [unsigned int32] switches the controller Off (=0) or On (=1)
==== Return arguments:

Error described in the Response message>Body section

=== Interf.CtrlOnOffGet
Returns the status of the Interferometer controller.
==== Arguments:

None
==== Return arguments:

Status [unsigned int32] indicates if the controller is Off (=0) or On (=1)

Error described in the Response message>Body section

=== Interf.CtrlPropsSet
Sets the Interferometer controller properties.
==== Arguments:

Setpoint (V) [float32]

P-gain [float32]

Time constant (s) [float32]

Slope [unsigned int16] where 0=no change, 1=Positive, 2=Negative
==== Return arguments:

Error described in the Response message>Body section

=== Interf.CtrlPropsGet
Returns the Interferometer controller properties.
==== Arguments:

None
==== Return arguments:

Setpoint (V) [float32]

P-gain [float32]

Time constant (s) [float32]

Slope [unsigned int16] where 0=Negative and 1=Positive

Error described in the Response message>Body section

=== Interf.WPiezoSet
Sets the working piezo of the Interferometer.
==== Arguments:

Working piezo [unsigned int16] sets the working piezo. 0=no change, 1=Z, 2=Aux
==== Return arguments:

Error described in the Response message>Body section

=== Interf.WPiezoGet
Returns the working piezo of the Interferometer.
==== Arguments:

None
==== Return arguments:

Working piezo [unsigned int16] is the working piezo. 0=Z, 1=Aux

Error described in the Response message>Body section

=== Interf.ValGet
Returns the current value of the Interferometer.
==== Arguments:

None
==== Return arguments:

Value (V) [float32]

Error described in the Response message>Body section

=== Interf.CtrlCalibrOpen
Opens the Interferometer Calibration module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== Interf.CtrlReset
Resets the Interferometer controller.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== Interf.CtrlNullDefl
Nulls the deflection of the Interferometer.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

== Laser module

=== Laser.OnOffSet
Switches the laser on or off.
==== Arguments:

On/Off [unsigned int32] switches the laser Off (=0) or On (=1)
==== Return arguments:

Error described in the Response message>Body section

=== Laser.OnOffGet
Returns the status of the laser.
==== Arguments:

None
==== Return arguments:

Status [unsigned int32] indicates if the laser is Off (=0) or On (=1)

Error described in the Response message>Body section

=== Laser.PropsSet
Sets the laser properties.
==== Arguments:

Power (mW) [float32] sets the laser power in mW.

Wavelength (nm) [float32] sets the laser wavelength in nm.

Pulse duration (ns) [float32] sets the laser pulse duration in ns.
==== Return arguments:

Error described in the Response message>Body section

=== Laser.PropsGet
Returns the laser properties.
==== Arguments:

None
==== Return arguments:

Power (mW) [float32] is the laser power in mW.

Wavelength (nm) [float32] is the laser wavelength in nm.

Pulse duration (ns) [float32] is the laser pulse duration in ns.

Error described in the Response message>Body section

=== Laser.PowerGet
Returns the current laser power.
==== Arguments:

None
==== Return arguments:

Power (mW) [float32] is the current laser power in mW.

Error described in the Response message>Body section

== Beam Deflection

=== BeamDefl.HorConfigSet
Sets the horizontal configuration of the Beam Deflection module.
==== Arguments:

Calibration (V/m) [float32]

Offset (V) [float32]

Range (V) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== BeamDefl.HorConfigGet
Returns the horizontal configuration of the Beam Deflection module.
==== Arguments:

None
==== Return arguments:

Calibration (V/m) [float32]

Offset (V) [float32]

Range (V) [float32]

Error described in the Response message>Body section

=== BeamDefl.VerConfigSet
Sets the vertical configuration of the Beam Deflection module.
==== Arguments:

Calibration (V/m) [float32]

Offset (V) [float32]

Range (V) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== BeamDefl.VerConfigGet
Returns the vertical configuration of the Beam Deflection module.
==== Arguments:

None
==== Return arguments:

Calibration (V/m) [float32]

Offset (V) [float32]

Range (V) [float32]

Error described in the Response message>Body section

=== BeamDefl.IntConfigSet
Sets the intensity configuration of the Beam Deflection module.
==== Arguments:

Calibration (V/m) [float32]

Offset (V) [float32]

Range (V) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== BeamDefl.IntConfigGet
Returns the intensity configuration of the Beam Deflection module.
==== Arguments:

None
==== Return arguments:

Calibration (V/m) [float32]

Offset (V) [float32]

Range (V) [float32]

Error described in the Response message>Body section

=== BeamDefl.AutoOffset
Automatically offsets the Beam Deflection module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

== Signals

=== Signals.NamesGet
Returns the signals names list of the 128 signals available in the software.
==== Arguments:

None
==== Return arguments:

Signals names size [int] is the size in bytes of the signals names array

Signals names number [int] is the number of elements of the signals names array

Signals names (1D array string) returns an array of signals names strings, where each string comes prepended by its size in bytes

Error described in the Response message>Body section

=== Signals.RangeGet
Returns the range limits of the selected signal.
==== Arguments:

Signal index [int] is comprised between 0 and 127
==== Return arguments:

Maximum limit [float32]

Minimum limit [float32]

Error described in the Response message>Body section

=== Signals.ValGet
Returns the current value of the selected signal (oversampled during the Acquisition Period time, Tap).
==== Arguments:

Signal index [int] is comprised between 0 and 127

Wait for newest data [unsigned int32] selects whether the function returns the next available signal value or if it waits for a full period of new data. If 0, this function returns a value 0 to Tap seconds after being called. If 1, the function discards the first oversampled signal value received but returns the second value received. Thus, the function returns a value Tap to 2*Tap seconds after being called
==== Return arguments:

Signal value [float32]

Error described in the Response message>Body section

=== Signals.ValsGet
Returns the current value of the selected signals (oversampled during the Acquisition Period time, Tap).
==== Arguments:

Number of signals [int] is the number of signals to get. It defines the size of the Signal indexes array

Signal indexes (1D array int) are the indexes of the signals to get. The index is comprised between 0 and 127

Wait for newest data [unsigned int32] selects whether the function returns the next available signal value or if it waits for a full period of new data. If 0, this function returns a value 0 to Tap seconds after being called. If 1, the function discards the first oversampled signal value received but returns the second value received. Thus, the function returns a value Tap to 2*Tap seconds after being called
==== Return arguments:

Signal values (1D array float32)

Error described in the Response message>Body section

=== Signals.MeasNamesGet
Returns the list of names of the available measurements.
==== Arguments:

None
==== Return arguments:

Measurements names size [int] is the size in bytes of the Measurements names array

Measurements names number [int] is the number of elements of the Measurements names array

Measurements names (1D array string) returns an array of Measurements names strings, where each string comes prepended by its size in bytes

Error described in the Response message>Body section

=== Signals.AddRTGet
Returns the status of the Add to RT switch of the selected signal.
==== Arguments:

Signal index [int] is comprised between 0 and 127
==== Return arguments:

Add to RT status [unsigned int32] indicates if the signal is added to RT. 0=Off, 1=On

Error described in the Response message>Body section

=== Signals.AddRTSet
Sets the status of the Add to RT switch of the selected signal.
==== Arguments:

Signal index [int] is comprised between 0 and 127

Add to RT status [unsigned int32] sets if the signal is added to RT. 0=no change, 1=On, 2=Off
==== Return arguments:

Error described in the Response message>Body section

== User Inputs

=== UserIn.CalibrSet
Sets the calibration and offset of the selected User Input.
==== Arguments:

User Input index [int] is comprised between 0 and 7

Calibration per volt [float32]

Offset in physical units [float32]
==== Return arguments:

Error described in the Response message>Body section

== User Outputs

=== UserOut.ModeSet
Sets the mode of the selected User Output.
==== Arguments:

Output index [int] is comprised between 0 and 7

Mode [unsigned int16] sets the mode. 0=no change, 1=Manual, 2=Calculated
==== Return arguments:

Error described in the Response message>Body section

=== UserOut.ModeGet
Returns the mode of the selected User Output.
==== Arguments:

Output index [int] is comprised between 0 and 7
==== Return arguments:

Mode [unsigned int16] is the mode. 0=Manual, 1=Calculated

Error described in the Response message>Body section

=== UserOut.MonitorChSet
Sets the monitor channel of the selected User Output.
==== Arguments:

Output index [int] is comprised between 0 and 7

Monitor channel index [int] is the index of the monitor channel.
==== Return arguments:

Error described in the Response message>Body section

=== UserOut.MonitorChGet
Returns the monitor channel of the selected User Output.
==== Arguments:

Output index [int] is comprised between 0 and 7
==== Return arguments:

Monitor channel index [int] is the index of the monitor channel.

Error described in the Response message>Body section

=== UserOut.ValSet
Sets the value of the selected User Output.
==== Arguments:

Output index [int] is comprised between 0 and 7

Value (V) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== UserOut.CalibrSet
Sets the calibration and offset of the selected User Output.
==== Arguments:

Output index [int] is comprised between 0 and 7

Calibration per volt [float32]

Offset in physical units [float32]
==== Return arguments:

Error described in the Response message>Body section

=== UserOut.CalcSignalNameSet
Sets the calculated signal name of the selected User Output.
==== Arguments:

Output index [int] is comprised between 0 and 7

Calculated signal name size [int] is the size in bytes of the Calculated signal name string

Calculated signal name [string] is the name of the calculated signal
==== Return arguments:

Error described in the Response message>Body section

=== UserOut.CalcSignalNameGet
Returns the calculated signal name of the selected User Output.
==== Arguments:

Output index [int] is comprised between 0 and 7
==== Return arguments:

Calculated signal name size [int] is the size in bytes of the Calculated signal name string

Calculated signal name [string] is the name of the calculated signal

Error described in the Response message>Body section

=== UserOut.CalcSignalConfigSet
Sets the calculated signal configuration of the selected User Output.
==== Arguments:

Output index [int] is comprised between 0 and 7

Signal 1 index [int] is the index of signal 1.

Signal 2 index [int] is the index of signal 2.

Operation [unsigned int16] sets the operation. 0=no change, 1=Signal1, 2=Signal2, 3=Signal1+Signal2, 4=Signal1-Signal2, 5=Signal1*Signal2, 6=Signal1/Signal2, 7=Signal1^Signal2, 8=log(Signal1), 9=exp(Signal1), 10=sqrt(Signal1), 11=abs(Signal1), 12=sin(Signal1), 13=cos(Signal1), 14=tan(Signal1), 15=asin(Signal1), 16=acos(Signal1), 17=atan(Signal1), 18=sinh(Signal1), 19=cosh(Signal1), 20=tanh(Signal1), 21=asinh(Signal1), 22=acosh(Signal1), 23=atanh(Signal1), 24=round(Signal1), 25=floor(Signal1), 26=ceil(Signal1), 27=min(Signal1,Signal2), 28=max(Signal1,Signal2)
==== Return arguments:

Error described in the Response message>Body section

=== UserOut.CalcSignalConfigGet
Returns the calculated signal configuration of the selected User Output.
==== Arguments:

Output index [int] is comprised between 0 and 7
==== Return arguments:

Signal 1 index [int] is the index of signal 1.

Signal 2 index [int] is the index of signal 2.

Operation [unsigned int16] is the operation. 0=Signal1, 1=Signal2, 2=Signal1+Signal2, 3=Signal1-Signal2, 4=Signal1*Signal2, 5=Signal1/Signal2, 6=Signal1^Signal2, 7=log(Signal1), 8=exp(Signal1), 9=sqrt(Signal1), 10=abs(Signal1), 11=sin(Signal1), 12=cos(Signal1), 13=tan(Signal1), 14=asin(Signal1), 15=acos(Signal1), 16=atan(Signal1), 17=sinh(Signal1), 18=cosh(Signal1), 19=tanh(Signal1), 20=asinh(Signal1), 21=acosh(Signal1), 22=atanh(Signal1), 23=round(Signal1), 24=floor(Signal1), 25=ceil(Signal1), 26=min(Signal1,Signal2), 27=max(Signal1,Signal2)

Error described in the Response message>Body section

=== UserOut.LimitsSet
Sets the limits of the selected User Output.
==== Arguments:

Output index [int] is comprised between 0 and 7

Lower limit (V) [float32]

Upper limit (V) [float32]
==== Return arguments:

Error described in the Response message>Body section

=== UserOut.LimitsGet
Returns the limits of the selected User Output.
==== Arguments:

Output index [int] is comprised between 0 and 7
==== Return arguments:

Lower limit (V) [float32]

Upper limit (V) [float32]

Error described in the Response message>Body section

== Digital Lines

=== DigLines.PropsSet
Sets the properties of the digital lines.
==== Arguments:

Number of lines [int] is the number of digital lines.

Line indexes (1D array int) are the indexes of the digital lines.

Direction (1D array unsigned int16) sets the direction of each line. 0=no change, 1=Input, 2=Output.

Initial value (1D array unsigned int16) sets the initial value of each line. 0=no change, 1=Low, 2=High.
==== Return arguments:

Error described in the Response message>Body section

=== DigLines.OutStatusSet
Sets the output status of the digital lines.
==== Arguments:

Number of lines [int] is the number of digital lines.

Line indexes (1D array int) are the indexes of the digital lines.

Status (1D array unsigned int16) sets the status of each line. 0=no change, 1=Low, 2=High.
==== Return arguments:

Error described in the Response message>Body section

=== DigLines.TTLValGet
Returns the current value of the digital lines.
==== Arguments:

Number of lines [int] is the number of digital lines.

Line indexes (1D array int) are the indexes of the digital lines.
==== Return arguments:

Values (1D array unsigned int16) returns the current value of each line. 0=Low, 1=High.

Error described in the Response message>Body section

=== DigLines.Pulse
Generates a pulse on the specified digital line.
==== Arguments:

Line index [int] is the index of the digital line.

Pulse width (s) [float32] is the pulse duration in seconds.

Polarity [unsigned int16] sets the polarity of the pulse. 0=no change, 1=Low, 2=High.
==== Return arguments:

Error described in the Response message>Body section

== Data Logger

=== DataLog.Open
Opens the Data Logger module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== DataLog.Start
Starts the acquisition in the Data Logger module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== DataLog.Stop
Stops the acquisition in the Data Logger module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== DataLog.StatusGet
Returns the current status of the Data Logger.
==== Arguments:

None
==== Return arguments:

Status [int] returns an index which corresponds to one of the following status: 0=disconnected, 1=idle, 2=start, 3=stop, 4=running, 5=TCP connect, 6=TCP disconnect, 7=buffer overflow

Error described in the Response message>Body section

=== DataLog.ChsSet
Sets the list of recorded channels in the Data Logger module.
==== Arguments:

Number of channels [int] is the number of recorded channels. It defines the size of the Channel indexes array

Channel indexes (1D array int) are the indexes of recorded channels. The index is comprised between 0 and 127, and it corresponds to the full list of signals available in the system. To get the signal name and its corresponding index in the list of the 128 available signals in the Nanonis Controller, use the Signal.NamesGet function, or check the RT Idx value in the Signals Manager module.
==== Return arguments:

Error described in the Response message>Body section

=== DataLog.ChsGet
Returns the list of recorded channels in the Data Logger module.
==== Arguments:

None
==== Return arguments:

Number of channels [int] is the number of recorded channels. It defines the size of the Channel indexes array

Channel indexes (1D array int) are the indexes of recorded channels. The index is comprised between 0 and 127, and it corresponds to the full list of signals available in the system. To get the signal name and its corresponding index in the list of the 128 available signals in the Nanonis Controller, use the Signal.NamesGet function, or check the RT Idx value in the Signals Manager module.

Error described in the Response message>Body section

=== DataLog.PropsSet
Sets the acquisition configuration and the save options in the Data Logger module.
==== Arguments:

Acquisition mode [unsigned int16] means that if Timed (=1), the selected channels are acquired during the acquisition duration time or until the user presses the Stop button. If Continuous (=0), the selected channels are acquired continuously until the user presses the Stop button. The acquired data are saved every time the averaged samples buffer reaches 25.000 samples and when the acquisition stops

Acquisition duration (hours) [int] sets the number of hours the acquisition lasts

Acquisition duration (minutes) [int] sets the number of minutes

Acquisition duration (seconds) [float32] sets the number of seconds

Averaging [int] sets how many data samples (received from the real-time system) are averaged for one data point saved into file

Basename size [int] is the size (number of characters) of the basename string

Basename [string] is the base name used for the saved images

Comment size [int] is the size in bytes of the Comment string

Comment [string] is the comment saved in the file

Number of modules [int] is the number of elements of the List of modules string array

List of modules (1D array string) sets the modules names whose parameters will be saved in the header of the files. The size of each string item should come right before it as integer 32
==== Return arguments:

Error described in the Response message>Body section

=== DataLog.PropsGet
Returns the acquisition configuration and the save options in the Data Logger module.
==== Arguments:

None
==== Return arguments:

Acquisition mode [unsigned int16] means that if Timed (=1), the selected channels are acquired during the acquisition duration time or until the user presses the Stop button. If Continuous (=0), the selected channels are acquired continuously until the user presses the Stop button. The acquired data are saved every time the averaged samples buffer reaches 25.000 samples and when the acquisition stops

Acquisition duration (hours) [int] returns the number of hours the acquisition lasts

Acquisition duration (minutes) [int] returns the number of minutes

Acquisition duration (seconds) [float32] returns the number of seconds

Averaging [int] returns how many data samples (received from the real-time system) are averaged for one data point saved into file

Basename size [int] returns the size in bytes of the Basename string

Basename [string] returns the base name used for the saved images

Comment size [int] returns the size in bytes of the Comment string

Comment [string] returns the comment saved in the file

Error described in the Response message>Body section

== TCP Logger

=== TCPLog.Start
Starts the acquisition in the TCP Logger module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== TCPLog.Stop
Stops the acquisition in the TCP Logger module.
==== Arguments:

None
==== Return arguments:

Error described in the Response message>Body section

=== TCPLog.ChsSet
Sets the list of recorded channels in the TCP Logger module.
==== Arguments:

Number of channels [int] is the number of recorded channels. It defines the size of the Channel indexes array

Channel indexes (1D array int) are the indexes of recorded channels. The index is comprised between 0 and 127, and it corresponds to the full list of signals available in the system. To get the signal name and its corresponding index in the list of the 128 available signals in the Nanonis Controller, use the Signal.NamesGet function, or check the RT Idx value in the Signals Manager module.
==== Return arguments:

Error described in the Response message>Body section

=== TCPLog.OversamplSet
Sets the oversampling value in the TCP Logger.
==== Arguments:

Oversampling value [int] sets the oversampling index, where index could be any value from 0 to 1000
==== Return arguments:

Error described in the Response message>Body section

=== TCPLog.StatusGet
Returns the current status of the TCP Logger.
==== Arguments:

None
==== Return arguments:

Status [int] returns an index which corresponds to one of the following status: 0=disconnected, 1=idle, 2=start, 3=stop, 4=running, 5=TCP connect, 6=TCP disconnect, 7=buffer overflow

Error described in the Response message>Body section

== Oscilloscope High Resolution

=== OsciHR.ChSet
Sets the channel index of the Oscilloscope High Resolution.
==== Arguments:

Channel index [int] sets the channel to be used, where index could be any value from 0 to 15
==== Return arguments:

Error described in the Response message>Body section

=== OsciHR.ChGet
Returns the channel index of the Oscilloscope High Resolution.
==== Arguments:

None
==== Return arguments:

Channel index [int] is the channel to be used, where index could be any value from 0 to 15

Error described in the Response message>Body section

=== OsciHR.OversamplSet
Sets the oversampling value for the Oscilloscope High Resolution.
==== Arguments:

Oversampling value [int] sets the oversampling index, where index could be any value from 0 to 1000
==== Return arguments:

Error described in the Response message>Body section

=== OsciHR.OversamplGet
Returns the oversampling value for the Oscilloscope High Resolution.
==== Arguments:

None
==== Return arguments:

Oversampling value [int] is the oversampling index, where index could be any value from 0 to 1000

Error described in the Response message>Body section

=== OsciHR.CalibrModeSet
Sets the calibration mode of the Oscilloscope High Resolution.
==== Arguments:

Calibration mode [unsigned int16] sets the calibration mode. 0=no change, 1=Normal, 2=Calibration.
==== Return arguments:

Error described in the Response message>Body section

=== OsciHR.CalibrModeGet
Returns the calibration mode of the Oscilloscope High Resolution.
==== Arguments:

None
==== Return arguments:

Calibration mode [unsigned int16] is the calibration mode. 0=Normal, 1=Calibration.

Error described in the Response message>Body section

=== OsciHR.SamplesSet
Sets the number of samples for the Oscilloscope High Resolution.
==== Arguments:

Number of samples [int] sets the number of samples. 0 means no change.
==== Return arguments:

Error described in the Response message>Body section

=== OsciHR.SamplesGet
Returns the number of samples for the Oscilloscope High Resolution.
==== Arguments:

None
==== Return arguments:

Number of samples [int] is the number of samples.

Error described in the Response message>Body section

=== OsciHR.PreTrigSet
Sets the pre-trigger samples for the Oscilloscope High Resolution.
==== Arguments:

Pre-trigger samples [int] sets the number of pre-trigger samples. 0 means no change.
==== Return arguments:

Error described in the Response message>Body section

=== OsciHR.PreTrigGet
Returns the pre-trigger samples for the Oscilloscope High Resolution
