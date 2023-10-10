import { Injectable } from '@nestjs/common';
import { CreateQuestaoDto } from './dto/create-questao.dto';
import { UpdateQuestaoDto } from './dto/update-questao.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class QuestaoService {
  constructor(private prisma: PrismaService){}

  create(createQuestaoDto: CreateQuestaoDto) {
    return this.prisma.questao.create({
  
      data: createQuestaoDto
      
    });
  }

  findAllquestao() {
    return this.prisma.questao.findMany();
  }
  
  findAllByProfessor(id: number){
    return this.prisma.questao.findMany({
      where: {
        professorId: id,
      }
    });
  }


  findOne(id: number) {
    return this.prisma.questao.findUnique({
      where: { id

      }
    });
  }

  update(id: number, updateQuestaoDto: UpdateQuestaoDto) {
    return this.prisma.questao.update({
      where: {id},
      data: updateQuestaoDto,
    });
  }

  remove(id: number) {
    return this.prisma.questao.delete({
      where: {id}
    });
  }
}
