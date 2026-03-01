import { useState, useEffect, useRef } from 'react';
import { Activity, Radio, Signal, Cpu, HardDrive, Check } from 'lucide-react';
import { motion, AnimatePresence } from 'motion/react';

interface LogEntry {
  id: number;
  timestamp: string;
  data: object;
}

interface Call {
  id: number;
  number: string;
  status: string;
}

export default function App() {
  const [uptime, setUptime] = useState(0);
  const [logs, setLogs] = useState<LogEntry[]>([]);
  const [processedMessage, setProcessedMessage] = useState('');
  const [calls, setCalls] = useState<Call[]>([
    { id: 1, number: '+63917...1234', status: 'Kumokonekta...' },
    { id: 2, number: '+63918...5678', status: 'Tumutugtog ng Audio...' },
    { id: 3, number: '+63905...9012', status: 'USSD Session Aktibo' },
  ]);
  const [totalOutreach, setTotalOutreach] = useState(1247);
  const [emergencyMode, setEmergencyMode] = useState(false);
  const [dataIntegrity, setDataIntegrity] = useState(false);
  const [cpuLoad, setCpuLoad] = useState(15);
  const [memoryUsed, setMemoryUsed] = useState(1.2);
  const logContainerRef = useRef<HTMLDivElement>(null);

  // Uptime counter
  useEffect(() => {
    const timer = setInterval(() => {
      setUptime((prev) => prev + 1);
    }, 1000);
    return () => clearInterval(timer);
  }, []);

  // Generate scrolling logs
  useEffect(() => {
    const generateLog = () => {
      const weatherData = {
        sensor_id: `SARAI-${Math.floor(Math.random() * 1000)}`,
        timestamp: new Date().toISOString(),
        location: { lat: 14.5995, lon: 120.9842 },
        wind_speed_kph: (Math.random() * 30 + 10).toFixed(2),
        rain_probability: (Math.random() * 100).toFixed(1),
        temperature_c: (Math.random() * 10 + 25).toFixed(1),
        humidity_percent: (Math.random() * 40 + 60).toFixed(1),
        alert_level: Math.random() > 0.7 ? 'HIGH' : 'MODERATE',
      };

      const newLog: LogEntry = {
        id: Date.now(),
        timestamp: new Date().toLocaleTimeString('en-US', { hour12: false }),
        data: weatherData,
      };

      setLogs((prev) => {
        const updated = [newLog, ...prev].slice(0, emergencyMode ? 15 : 8);
        return updated;
      });

      // Trigger data integrity check
      setDataIntegrity(true);
      setTimeout(() => setDataIntegrity(false), 800);
    };

    const interval = setInterval(generateLog, emergencyMode ? 1500 : 3000);
    generateLog(); // Initial log
    return () => clearInterval(interval);
  }, [emergencyMode]);

  // Process message animation
  useEffect(() => {
    const message = 'BABALA: May paparating na ulan sa susunod na 2 oras. Maghanda ng proteksyon para sa mga pananim.';
    let index = 0;

    const typeMessage = () => {
      if (index < message.length) {
        setProcessedMessage(message.slice(0, index + 1));
        index++;
        setTimeout(typeMessage, emergencyMode ? 30 : 50);
      } else {
        setTimeout(() => {
          index = 0;
          setProcessedMessage('');
          setTimeout(typeMessage, 1000);
        }, emergencyMode ? 2000 : 4000);
      }
    };

    typeMessage();
  }, [emergencyMode]);

  // Update calls status
  useEffect(() => {
    const interval = setInterval(() => {
      setCalls((prev) => {
        const updated = prev.map((call) => {
          const statuses = ['Kumokonekta...', 'Tumutugtog ng Audio...', 'USSD Session Aktibo', 'Nakumpleto na'];
          const randomStatus = statuses[Math.floor(Math.random() * statuses.length)];
          return { ...call, status: randomStatus };
        });
        return updated;
      });
    }, emergencyMode ? 2000 : 4000);
    return () => clearInterval(interval);
  }, [emergencyMode]);

  // Increment outreach counter
  useEffect(() => {
    const interval = setInterval(() => {
      setTotalOutreach((prev) => prev + Math.floor(Math.random() * 3 + 1));
    }, emergencyMode ? 1000 : 2500);
    return () => clearInterval(interval);
  }, [emergencyMode]);

  // Random CPU and Memory fluctuations
  useEffect(() => {
    const interval = setInterval(() => {
      setCpuLoad(Math.floor(Math.random() * 20 + 10));
      setMemoryUsed(parseFloat((Math.random() * 0.5 + 1.0).toFixed(1)));
    }, 5000);
    return () => clearInterval(interval);
  }, []);

  const formatUptime = (seconds: number) => {
    const h = Math.floor(seconds / 3600);
    const m = Math.floor((seconds % 3600) / 60);
    const s = seconds % 60;
    return `${h.toString().padStart(2, '0')}:${m.toString().padStart(2, '0')}:${s.toString().padStart(2, '0')}`;
  };

  return (
    <div
      className="min-h-screen bg-[#09090b] text-[#22c55e] p-6"
      style={{ fontFamily: "'JetBrains Mono', monospace" }}
    >
      <div className={`max-w-[1600px] mx-auto ${emergencyMode ? 'emergency-flash' : ''}`}>
        {/* Header */}
        <motion.header
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          className="mb-6 pb-4 border-b border-[#22c55e]/30"
        >
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4">
              <h1 className="text-2xl font-bold tracking-wider">SABI / GSM-BRIDGE v1.0.4</h1>
              <div className="flex items-center gap-2 px-3 py-1 bg-red-500/20 border border-red-500 rounded">
                <div className="w-2 h-2 bg-red-500 rounded-full blink-animation"></div>
                <span className="text-red-500 text-sm font-bold">LIVE</span>
              </div>
            </div>
            <div className="flex items-center gap-2 text-[#3b82f6]">
              <Activity className="w-5 h-5" />
              <span className="text-lg font-mono">UPTIME: {formatUptime(uptime)}</span>
            </div>
          </div>
        </motion.header>

        {/* Emergency Button */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.2 }}
          className="mb-4"
        >
          <button
            onClick={() => setEmergencyMode(!emergencyMode)}
            className={`px-6 py-3 rounded font-bold tracking-wide transition-all ${emergencyMode
                ? 'bg-red-500 text-white border-2 border-red-300 shadow-lg shadow-red-500/50'
                : 'bg-[#22c55e] text-[#09090b] border-2 border-[#22c55e] hover:shadow-lg hover:shadow-[#22c55e]/50'
              }`}
          >
            {emergencyMode ? '⚠️ EMERGENCY MODE NAKASINDI' : '🚨 I-TRIGGER ANG EMERGENCY ADVISORY'}
          </button>
        </motion.div>

        {/* Main Grid */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
          {/* Column 1: INGEST */}
          <motion.div
            initial={{ opacity: 0, x: -50 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ delay: 0.3 }}
            className="bg-[#0f0f10] border border-[#22c55e]/40 rounded-lg p-4"
          >
            <div className="flex items-center justify-between mb-3">
              <h2 className="text-lg font-bold text-[#3b82f6]">[PAG-TANGGAP]</h2>
              {dataIntegrity && (
                <motion.div
                  initial={{ scale: 0 }}
                  animate={{ scale: 1 }}
                  exit={{ scale: 0 }}
                >
                  <Check className="w-5 h-5 text-[#22c55e]" />
                </motion.div>
              )}
            </div>
            <div className="mb-3 text-xs text-[#22c55e]/70 border-b border-[#22c55e]/20 pb-2">
              Webhook ng Project SARAI
            </div>
            <div
              ref={logContainerRef}
              className="h-[400px] overflow-hidden bg-black/50 rounded p-3 border border-[#22c55e]/20"
            >
              <AnimatePresence mode="popLayout">
                {logs.map((log, index) => (
                  <motion.div
                    key={log.id}
                    initial={{ opacity: 0, y: -20 }}
                    animate={{ opacity: 1 - index * 0.1, y: 0 }}
                    exit={{ opacity: 0 }}
                    transition={{ duration: 0.3 }}
                    className="mb-2 text-xs border-l-2 border-[#22c55e]/50 pl-2 fade-in"
                  >
                    <div className="text-[#3b82f6] mb-1">[{log.timestamp}]</div>
                    <pre className="text-[#22c55e]/80 whitespace-pre-wrap overflow-hidden">
                      {JSON.stringify(log.data, null, 2)}
                    </pre>
                  </motion.div>
                ))}
              </AnimatePresence>
            </div>
          </motion.div>

          {/* Column 2: PROCESS */}
          <motion.div
            initial={{ opacity: 0, y: 50 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.4 }}
            className="bg-[#0f0f10] border border-[#22c55e]/40 rounded-lg p-4"
          >
            <h2 className="text-lg font-bold text-[#3b82f6] mb-3">[PAGPROSESO]</h2>
            <div className="mb-3 text-xs text-[#22c55e]/70 border-b border-[#22c55e]/20 pb-2">
              Engine ng Lokalisasyon
            </div>
            <div className="h-[200px] bg-black/50 rounded p-4 border border-[#22c55e]/20 mb-4 flex items-center">
              <p className="text-sm text-[#22c55e] leading-relaxed">
                {processedMessage}
                <span className="inline-block w-2 h-4 bg-[#22c55e] ml-1 blink-cursor"></span>
              </p>
            </div>

            {/* Audio Waveform */}
            <div className="mb-3 text-xs text-[#22c55e]/70">Synthesis ng Teksto-sa-Boses</div>
            <div className="h-[150px] bg-black/50 rounded p-4 border border-[#22c55e]/20 flex items-end justify-around gap-1">
              {[...Array(32)].map((_, i) => (
                <motion.div
                  key={i}
                  className="w-full bg-[#3b82f6] rounded-t"
                  animate={{
                    height: [
                      `${Math.random() * 60 + 20}%`,
                      `${Math.random() * 80 + 10}%`,
                      `${Math.random() * 60 + 20}%`,
                    ],
                  }}
                  transition={{
                    duration: 0.5,
                    repeat: Infinity,
                    delay: i * 0.05,
                  }}
                />
              ))}
            </div>
          </motion.div>

          {/* Column 3: TRANSMIT */}
          <motion.div
            initial={{ opacity: 0, x: 50 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ delay: 0.5 }}
            className="bg-[#0f0f10] border border-[#22c55e]/40 rounded-lg p-4"
          >
            <h2 className="text-lg font-bold text-[#3b82f6] mb-3">[PAGPAPADALA]</h2>
            <div className="mb-3 text-xs text-[#22c55e]/70 border-b border-[#22c55e]/20 pb-2">
              Pila ng GSM Broadcast
            </div>
            <div className="h-[240px] bg-black/50 rounded p-3 border border-[#22c55e]/20 mb-4">
              <AnimatePresence mode="popLayout">
                {calls.map((call) => (
                  <motion.div
                    key={call.id}
                    initial={{ opacity: 0, x: 20 }}
                    animate={{ opacity: 1, x: 0 }}
                    className="mb-3 p-2 bg-[#22c55e]/10 border-l-4 border-[#3b82f6] rounded fade-in"
                  >
                    <div className="flex items-center justify-between text-sm">
                      <span className="text-[#22c55e] font-bold">{call.number}</span>
                      <Radio className="w-4 h-4 text-[#3b82f6]" />
                    </div>
                    <div className="text-xs text-[#3b82f6] mt-1">{call.status}</div>
                  </motion.div>
                ))}
              </AnimatePresence>
            </div>

            {/* Total Outreach Counter */}
            <div className="bg-gradient-to-br from-[#22c55e]/20 to-[#3b82f6]/20 rounded-lg p-4 border-2 border-[#22c55e]">
              <div className="text-xs text-[#22c55e]/70 mb-2">KABUUANG NAABOT</div>
              <motion.div
                key={totalOutreach}
                initial={{ scale: 1.1 }}
                animate={{ scale: 1 }}
                className="text-4xl font-bold text-[#22c55e] tracking-wider"
              >
                {totalOutreach.toLocaleString()}
              </motion.div>
            </div>
          </motion.div>
        </div>

        {/* Footer: Hardware Layer */}
        <motion.footer
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.6 }}
          className="bg-[#0f0f10] border border-[#22c55e]/40 rounded-lg p-4"
        >
          <div className="text-xs text-[#22c55e]/70 mb-3 border-b border-[#22c55e]/20 pb-2">
            KALUSUGAN NG SISTEMA / LAYER NG HARDWARE
          </div>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            {/* CPU Load */}
            <div className="flex items-center gap-3">
              <Cpu className="w-6 h-6 text-[#3b82f6]" />
              <div>
                <div className="text-xs text-[#22c55e]/70">Karga ng CPU</div>
                <div className="text-lg font-bold text-[#22c55e]">{cpuLoad}%</div>
              </div>
            </div>

            {/* Memory */}
            <div className="flex items-center gap-3">
              <HardDrive className="w-6 h-6 text-[#3b82f6]" />
              <div>
                <div className="text-xs text-[#22c55e]/70">Memorya</div>
                <div className="text-lg font-bold text-[#22c55e]">
                  {memoryUsed}GB/4GB
                </div>
              </div>
            </div>

            {/* GSM Signal */}
            <div className="flex items-center gap-3">
              <Signal className="w-6 h-6 text-[#22c55e]" />
              <div>
                <div className="text-xs text-[#22c55e]/70">Signal ng GSM</div>
                <div className="text-lg font-bold text-[#22c55e]">████ Puno</div>
              </div>
            </div>

            {/* Active Tower */}
            <div className="flex items-center gap-3">
              <Radio className="w-6 h-6 text-[#3b82f6]" />
              <div>
                <div className="text-xs text-[#22c55e]/70">Aktibong Tower</div>
                <div className="text-sm font-bold text-[#22c55e]">BUL-CENTRAL-01</div>
              </div>
            </div>
          </div>
        </motion.footer>
      </div>

      {/* Custom Styles */}
      <style>{`
        @keyframes blink {
          0%, 49% { opacity: 1; }
          50%, 100% { opacity: 0; }
        }

        .blink-animation {
          animation: blink 1s infinite;
        }

        .blink-cursor {
          animation: blink 0.8s infinite;
        }

        @keyframes emergencyFlash {
          0%, 100% { box-shadow: 0 0 0px rgba(239, 68, 68, 0); }
          50% { box-shadow: 0 0 40px rgba(239, 68, 68, 0.5); }
        }

        .emergency-flash {
          animation: emergencyFlash 1s infinite;
        }

        .fade-in {
          animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
          from {
            opacity: 0;
            transform: translateY(-10px);
          }
          to {
            opacity: 1;
            transform: translateY(0);
          }
        }
      `}</style>
    </div>
  );
}