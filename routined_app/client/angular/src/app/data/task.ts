export class Task {
    task_id: number;
    name: string;
    description: string;
    duration: number;

    constructor(id: number, name: string, description: string, duration: number) {
        this.name = name;
        this.task_id = id;
        this.description = description;
        this.duration = duration;
    }
}
