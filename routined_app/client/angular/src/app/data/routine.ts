import {Task} from './task';

export class Routine {
    id: number;
    name: string;
    occurence: string;
    startTime: TimeRanges;
    endTime: TimeRanges;
    tasks: Task[];

    constructor(id: number, name: string, occurence: string, startTime: TimeRanges, endTime: TimeRanges) {
        this.id = id;
        this.name = name;
        this.occurence = occurence;
        this.startTime = startTime;
        this.endTime = endTime;
    }
}
