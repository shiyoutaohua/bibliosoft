package cn.ly.demo.base.dao;

import cn.ly.demo.base.dao.mapper.NoteMapper;
import cn.ly.demo.base.entity.Note;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class NoteDao {
    @Autowired
    private NoteMapper noteMapper;

    public Note getNoteById(int id) {
        Note note = new Note();
        note.setId(1);
        return noteMapper.getNoteById(note);
    }

    public void addNote(Note note) {
        noteMapper.addNote(note);
    }

    public List<Note> getNoteList(int startIndex, int rowCount) {
        HashMap<String, Integer> parmaMap = new HashMap<>();
        parmaMap.put("startIndex", startIndex);
        parmaMap.put("rowCount", rowCount);
        return noteMapper.getNoteList(parmaMap);
    }
}
