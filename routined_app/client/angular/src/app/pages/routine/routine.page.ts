import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Routine } from 'src/app/data/routine';
import { DataService } from 'src/app/services/data.service';
import { PickerController } from '@ionic/angular';
import { Task } from 'src/app/data/task';

@Component({
  selector: 'app-routine',
  templateUrl: './routine.page.html',
  styleUrls: ['./routine.page.scss'],
})
export class RoutinePage implements OnInit {
  routine: Routine;

  constructor(
    private activatedRoute: ActivatedRoute,
    private pickerController: PickerController
    ) { }

  ngOnInit() {
    const id = this.activatedRoute.snapshot.paramMap.get('id');
    this.routine = new DataService().getRoutineById(parseInt(id, 10));
  }

  async presentPicker() {
    const picker = await this.pickerController.create({
      buttons: [
        {
          text: 'Confirm',
          handler: (selected) => {
            this.routine.occurence = selected.occurence.value;
          },
        }
      ],
      columns: [
        {
          name: 'occurence',
          options: [
            { text: 'Daily', value: 'Daily' },
            { text: 'Weekly', value: 'Weekly' },
            { text: 'Monthly', value: 'Monthly' },
            { text: 'Yearly', value: 'Yearly' },
          ]
        }
      ]
    });
    await picker.present();
  }

  getTasks(): Task[]{
    return new DataService().getTasks();
  }
}
