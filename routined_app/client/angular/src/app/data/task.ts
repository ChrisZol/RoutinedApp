export class Task {
    id: number;
    name: string;
    description: string;
    duration: number;

    constructor(id: number, name: string, description: string, duration: number) {
        this.name = name;
        this.id = id;
        this.description = description;
        this.duration = duration;
    }
}
