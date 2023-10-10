import { Injectable } from '@nestjs/common';
import { CreateProfessorDto } from './dto/create-professor.dto';
import { UpdateProfessorDto } from './dto/update-professor.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class ProfessorService {

  constructor(private prisma: PrismaService){

  }

  create(createProfessorDto: CreateProfessorDto) {
    return 'This action adds a new professor';
  }

  findAll() {
    return this.prisma.professor.findMany;
  }

  findOne(id: number) {
    return this.prisma.professor.findUnique({
      where:{
        id
      }
    });
  }

  update(id: number, updateProfessorDto: UpdateProfessorDto) {
    return `This action updates a #${id} professor`;
  }

  remove(id: number) {
    return `This action removes a #${id} professor`;
  }
}
