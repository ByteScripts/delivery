import type { TimelineItem } from "@/App";
import { cn } from "@/lib/utils";

interface Props {
  items: TimelineItem[];
}

export const Timeline: React.FC<Props> = ({ items }) => {
  return (
    <ol className="border-t border-gray-500 flex">
      {items.map((item, index) => (
        <li
          key={index}
          className={cn("relative w-full", {
            "before:absolute before:inset-0 before:bg-green-500 before:z-10 before:w-full before:h-0.5 before:mt-[-1px]":
              item.active,
          })}
        >
          <div className="max-w-[150px] mr-10">
            <div>
              <div
                className={cn("w-3 h-3 bg-gray-400 rounded-full md:-mt-[5px]", {
                  "bg-green-500": item.active,
                })}
              />
              <h4 className="mt-2 text-lg font-bold max-w-[90%] truncate">
                {item.subtitle}
              </h4>
            </div>
            <div className="ms-4 md:ms-0">
              <p className="text-sm font-medium truncate max-w-[150px]">
                {item.title}
              </p>
              <p className="mb-3 text-xs text-muted-foreground max-w-[150px] line-clamp-2">
                {item.content}
              </p>
            </div>
          </div>
        </li>
      ))}
    </ol>
  );
};
