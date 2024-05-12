import { ShoppingCart } from "lucide-react";
import { ThemeProvider } from "./components/theme-provider";
import { Timeline } from "./components/timeline";
import { Badge } from "./components/ui/badge";
import { Card } from "./components/ui/card";
import { useState } from "react";
import { useNuiEvent } from "./hooks/useNuiEvent";
import { debugData } from "./utils/debugData";
import { AnimatePresence, motion } from "framer-motion";

interface Data {
  locales: {
    [key: string]: string;
  };
  orderId: string;
  currentStatus: string;
  orderHistory: TimelineItem[];
  statistics: {
    value: string;
    color: string;
  }[];
}

export interface TimelineItem {
  title: string;
  subtitle: string;
  content: string;
  active?: boolean;
}

export default function App() {
  const [data, setData] = useState<Data | undefined>();

  useNuiEvent("setData", setData);
  debugData<Data>(
    [
      {
        action: "setData",
        data: {
          locales: {
            title: "Order",
            orderHistory: "Order History",
            statistics: "Statistics",
          },
          orderId: "123",
          currentStatus: "Collecting items",
          orderHistory: [
            {
              title: "Restaurant 1 hello world I am too long",
              subtitle: "Order #1",
              content:
                "2x Pizza, 1x Coke, 1x Fries, 2x Pizza, 1x Coke, 1x Fries, 2x Pizza, 1x Coke, 1x Fries",
              active: true,
            },
            {
              title: "Restaurant 2",
              subtitle: "Order #2",
              content: "1x Burger, 1x Fries",
              active: true,
            },
            {
              title: "Restaurant 3",
              subtitle: "Order #3",
              content: "2x Burger, 1x Fries",
            },
          ],
          statistics: [
            {
              value: "Zeitabweichung: ~8:37min",
              color: "red",
            },
            {
              value: "Zufriedenheit: 90%",
              color: "orange",
            },
            {
              value: "Insgesamte Lieferung: 100",
              color: "green",
            },
          ],
        },
      },
    ],
    5
  );
  if (!data) return null;

  return (
    <ThemeProvider defaultTheme="dark" storageKey="vite-ui-theme">
      <AnimatePresence>
        <motion.div
          className="absolute top-2 left-1/2 transform -translate-x-1/2"
          initial={{ opacity: 0, translateX: "-50%", y: -20 }}
          animate={{ opacity: 1, translateX: "-50%", y: 0 }}
          exit={{ opacity: 0, translateX: "-50%", y: -20 }}
        >
          <Card className="p-3 max-w-[800px] flex flex-col gap-2">
            <div className="flex items-center justify-between">
              <div>
                <h2 className="text-2xl font-semibold">
                  {data.locales.title} #{data.orderId}
                </h2>
                <div className="text-muted-foreground text-sm max-w-[300px]">
                  {data.currentStatus}
                </div>
              </div>
              <div className="w-10 h-10 bg-gray-500 rounded-full flex items-center justify-center">
                <ShoppingCart size="20" />
              </div>
            </div>
            <hr className=" border-gray-500" />
            <div className="flex flex-col gap-2">
              <h4 className="text-lg font-semibold">
                {data.locales.orderHistory}
              </h4>
              <Timeline items={data.orderHistory} />
            </div>
            <hr className="border-gray-500" />
            <div>
              <h4 className="text-lg font-semibold mb-2">
                {data.locales.statistics}
              </h4>
              <div className="flex items-center gap-2 flex-wrap">
                {data.statistics.map((statistic, index) => (
                  <Badge key={index} variant={statistic.color as any}>
                    {statistic.value}
                  </Badge>
                ))}
              </div>
            </div>
          </Card>
        </motion.div>
      </AnimatePresence>
    </ThemeProvider>
  );
}
