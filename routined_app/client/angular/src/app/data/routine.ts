import {Task} from './task';

export class Routine {
    routine_id: number;
    name: string;
    occurence: string;
    start_time: Date;
    end_time: Date;
    tasks: Task[];

    constructor(id: number, name: string, occurence: string, startTime: Date, endTime: Date) {
        this.routine_id = id;
        this.name = name;
        this.occurence = occurence;
        this.start_time = startTime;
        this.end_time = endTime;
    }
}
