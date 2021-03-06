package by.bsuir.police.service.impl;

import by.bsuir.police.dao.impl.DocumentDaoImpl;
import by.bsuir.police.entity.Document;
import by.bsuir.police.exception.DaoException;
import by.bsuir.police.exception.ServiceException;
import by.bsuir.police.service.DocService;

import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Optional;

/**
 * The type Doc service.
 */
public class DocServiceImpl implements DocService {

    private DocumentDaoImpl documentDao = new DocumentDaoImpl();

    @Override
    public Optional<Document> searchById(int id) {
        return documentDao.searchById(id);
    }

    @Override
    public void remove(int id) throws ServiceException {
        try {
            documentDao.remove(id);
        } catch (DaoException e) {
            throw new ServiceException("Delete document is failed", e);
        }
    }

    @Override
    public ArrayList<Document> showAll() {
        return documentDao.showAll();
    }

    @Override
    public void addDoc(String statement, Date time, double reward, String information, Date leadTime, String name,
                       String lastName, Part imagePart) throws ServiceException {
        try {
            InputStream inputStream = imagePart.getInputStream();
            documentDao.addDocument(statement, time, reward, information, leadTime, name, lastName, inputStream);
        } catch (DaoException | IOException e) {
            throw new ServiceException("Add document is failed", e);
        }

    }
}
