import {Task} from './task';

export class Routine {
    id: number;
    name: string;
    occurence: string;
    startTime: Date;
    endTime: Date;
    tasks: Task[];

    constructor(id: number, name: string, occurence: string, startTime: Date, endTime: Date) {
        this.id = id;
        this.name = name;
        this.occurence = occurence;
        this.startTime = startTime;
        this.endTime = endTime;
    }
}
