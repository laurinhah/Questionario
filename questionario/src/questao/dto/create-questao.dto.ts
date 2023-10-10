
import { ApiProperty } from '@nestjs/swagger';
import { Dificuldade } from '@prisma/client';
import { map } from 'rxjs';
import internal from 'stream';

export class CreateQuestaoDto {
 
    enunciado: string

    gabarito: boolean

    assuntoId: number
    
    dificuldade: Dificuldade

    professorId: number 
}
